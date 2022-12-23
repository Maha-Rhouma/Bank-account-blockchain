pragma solidity ^0.8.7;

contract TaskContract {
    uint nexId;
    
    struct Task {
        uint id;
        string name;
        string description;
    }
    
    Task[] task;
    
    function createTask (string memory _name, string memory _description) public {
        task.push(Task(nexId,_name, _description));
        nexId++;
    }
    
    function findIndex(uint _id) internal view returns (uint){
        for(uint i = 0; i< task.length; i++){
            if(task[i].id == _id){
                return i;
            }
        }
        revert("Task not found");
    }
    
    function readTask(uint _id) public view returns (uint, string memory, string memory) {
        uint index = findIndex(_id);
        return (task[index].id, task[index].name, task[index].description);
    }
    
    function updateTask(uint _id, string memory _name, string memory _description) public{
        uint index = findIndex(_id);
        task[index].name = _name;
        task[index].description = _description;
    }
}
