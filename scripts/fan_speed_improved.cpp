// Monday, Nov 17 2025, 17:58 ,beautiful chill evening
#include <iostream>
#include <chrono>
#include <thread>
#include <string>
#include <fstream>
#include <optional>
#include <filesystem>

// the issue here is that reboots can change what directory the temp and the fan speed file reside instead of hwmon6 it could be any hwmon hence i need to check which hwmon
// the fan speed and temperature file are present and accordingly build the full path of the fan control file and the temperature file.

// hence the below path for the fan contrl file doesnt work sometimes
// const std::string fan_control_file_path = "/sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable";

const std::string fan_control_base_path = "/sys/devices/platform/asus-nb-wmi/hwmon/";
const std::string read_temperature_file_path = "/sys/class/thermal/thermal_zone0/temp"; // hardcoding this right now, but say in future if there are like 6 thermal_zones then
                                                                                        // I will have to build the temperature file path just like im building the fan control filepath

const int auto_control_fan = 2;
const int full_throttle_fan = 0;

const int upper_threshold_temperature = 85;
const int lower_threshold_temperature = 80;

const int sleep_time = 4000; // in ms


// imma use std::filesystem::directory_iterator for going through all hwmon*, this basically iterates on all directories with depth 1
std::optional<std::string> find_correct_fan_control_path() {

    const std::string fan_file_addition = "/pwm1_enable"; // ill add this string to all the iterators and check if the resulting master path exists or not
    
    for (auto hwmon_dirs : std::filesystem::directory_iterator(fan_control_base_path)) {

        std::string would_be_path = hwmon_dirs.path().string() + fan_file_addition;

        if (std::filesystem::exists(would_be_path)) {
            // std::cout << "fan control file found in " << would_be_path << std::endl;
            return would_be_path;
        }

    }

    return std::nullopt;
}





int get_temp() {
    int temperature;
    std::ifstream temperature_file(read_temperature_file_path);

    temperature_file >> temperature;

    return temperature/1000;
}


void set_fan_mode(const int fan_mode, const std::string fan_control_file_path) {
    std::ofstream fan_control_file(fan_control_file_path);

    fan_control_file << fan_mode;
}




int main() {

    // note that cuz of std::optional the fan_control_file_path is kinda of a bool and a string, a string if correct path is found, but a std::nullopt if no path is found which
    // can be tested as a bool so instead of writing the below statment, i will make it throw a std::err if not fan file is found
    const auto fan_control_file_path_optional = find_correct_fan_control_path();
    if (!fan_control_file_path_optional) {
        std::cerr << "Fan control file not found anywhere in " << fan_control_base_path << " !\n";
        return 1;
    }

    // convert the std::optinal<std::string> into a std::string
    const std::string fan_control_file_path = fan_control_file_path_optional.value();

    int current_temparature;
    set_fan_mode(auto_control_fan, fan_control_file_path); // set to auto control fan speed on startup
    int current_fan_mode = auto_control_fan;

    // what i want to do is the following
    // 1) keep blowing the fan if cpu > upper_threshold_temperature
    // 2) while coming back to noraml temps keep blowing fan till cpu comes below the lower_threshold_temperature
    // 3) once below the lower_threshold_temperature switch to silent/automatic mode
    while (true) {
        current_temparature = get_temp();

        if (current_temparature > upper_threshold_temperature && current_fan_mode == auto_control_fan) {
            set_fan_mode(full_throttle_fan, fan_control_file_path);
            current_fan_mode = full_throttle_fan;
        }
        else if (current_fan_mode == full_throttle_fan && current_temparature < lower_threshold_temperature) {
            set_fan_mode(auto_control_fan, fan_control_file_path);
            current_fan_mode = auto_control_fan;
        }

        std::this_thread::sleep_for(std::chrono::milliseconds(sleep_time));
    }

    return 0;
}
