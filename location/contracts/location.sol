pragma solidity >=0.4.25 <0.6.0;

contract Location {

    event NewEmployee(uint EmployeeId, string name, int latitude, int longtitude);

    int256 public maxGeoLatitude;
    int256 public minGeoLatitude;
    int256 public maxGeolongitudes;
    int256 public minGeoLongtitude;

    struct Employee {
        int256 latitude;
        int256 longitudes;
        string name;
    }

    address[] public employees;

    mapping(address => Employee) public employeeInfo;

    function inPlace(address employee) public constant returns(bool){
      for(uint256 i = 0; i < Employee.length; i++){
         if(Employee[i].latitude > minGeolatitude &  Employee[i].latitude < maxGeolatitude & Employee[i].longitudes > minGeoLongtitude &  Employee[i].longitudes < maxGeolongitudes) return true;
      }
      return false;
   }

    function _createEmployee(string memory _name, int _longtitude, int _latitude) private {
        uint id = employees.push(Employee(_name, _longtitude, _latitude)) - 1;
        emit NewEmployee(id, _name, _latitude, _longtitude);
    } 

    function pay() public payable {
        require(!inPlace(msg.sender));        
    }

}