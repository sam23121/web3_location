pragma solidity 0.8.7;

contract Location {

    event NewEmployee(uint EmployeeId, string name, int latitude, int longitude);

    int256 public maxGeoLatitude = 20; // boundries
    int256 public minGeoLatitude = 10;
    int256 public maxGeolongitudes = 20;
    int256 public minGeoLongtitude = 10 ;

    struct Employee {
        int256 latitude;
        int256 longitudes;
        string name;
    }

    address[] public employees;

    mapping(address => Employee) public employeeInfo;

    function inPlace(address employee) public constant returns(bool){ 
        if(employeeInfo[employee].latitude > minGeolatitude &  employeeInfo[employee].latitude < maxGeolatitude & employeeInfo[employee].longtitude > minGeoLongtitude &  employeeInfo[employee].longtitude < maxGeolongitudes) return true; 
        else return false;
   }

    function _createEmployee(string memory _name, int _longtitude, int _latitude) private {
        uint id = employees.push(Employee(_name, _longtitude, _latitude)) - 1;
        emit NewEmployee(id, _name, _latitude, _longtitude);
    } 

    function pay() public payable {
        for(uint256 i = 0; i < employee.length; i++){
         address employeeAddress = employees[i];
         if (require(inPlace(employeeAddress))) {
            employeeAddress.transfer(0.1);
         } 
        }
                
    }

}

