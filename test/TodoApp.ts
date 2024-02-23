import { expect } from "chai";
import { ethers } from "hardhat";

describe("TodoAppTest", function () {
  async function deployTodoApp() {
    const Todo = await ethers.getContractFactory("TodoApp");
    const todo = await Todo.deploy();

    return { todo };
  }

  describe("setTodo", function () {
    it("Should create new Todo", async function () {
      const { todo } = await deployTodoApp();

      const tx = await todo.setTodo(
        "My First Todo Item",
        "This is my very first todo item in 2024"
      );
      await tx.wait(); // Wait for transaction to be mined

      const TODO = await todo.getMyTodos();

      expect(TODO[0]).to.deep.equal({
        user_id: "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
        todoID: 1,
        title: "My First Todo Item",
        description: "This is my very first todo item in 2024",
        isDone: false,
        status: 0,
      });
    });
  });
});
