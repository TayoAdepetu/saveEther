// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract TodoApp {
    enum Status {
        Active,
        Inactive
    }

    struct todoInfo {
        address user_id;
        uint256 todoID;
        string title;
        string description;
        bool isDone;
        Status status;
    }

    todoInfo[] public allTodosArray;

    // uint256 public TrackingTodoID;

    function setTodo(
        string memory _title,
        string memory _description
    ) external returns (todoInfo[] memory) {
        allTodosArray.push(
            todoInfo(
                msg.sender,
                allTodosArray.length,
                _title,
                _description,
                false,
                Status.Active
            )
        );
        return getMyTodos();
    }

    function getMyTodos() public view returns (todoInfo[] memory) {
        //Can't do this, cos in Solidity, you can only use the push method to add elements to storage arrays,
        //todoInfo[] memory allMyTodos;

        todoInfo[] memory allMyTodos;
        for (uint256 i = 0; i < allTodosArray.length; i++) {
            if (
                allTodosArray[i].user_id == msg.sender &&
                allTodosArray[i].status == Status.Active
            ) {
                allMyTodos[i] = allTodosArray[i];
            }
        }

        return allMyTodos;
    }

    function changeTodoStatus(
        uint256 _todoID
    ) external returns (todoInfo memory) {
        uint256 index = _todoID - 1;
        allTodosArray[index].isDone = !allTodosArray[index].isDone;

        // if(allTodosArray[index].isDone == true){
        //     allTodosArray[index].isDone = false;
        // }else{
        //     allTodosArray[index].isDone = true;
        // }

        //returning a struct
        return allTodosArray[index];
    }

    function deleteTodo(uint256 _todoID) external returns (todoInfo[] memory) {
        uint256 index = _todoID - 1;
        allTodosArray[index].status = Status.Inactive;
        return getMyTodos();
    }
}
