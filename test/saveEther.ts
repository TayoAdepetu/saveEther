import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
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
      const { todo } = await loadFixture.deployTodoApp();

      const tx = await todo.setTodo(
        "My First Todo Item",
        "This is my very first todo item in 2024"
      );
      const TODO = await todo.getMyTodos();

      expect(TODO).to.equal({
        user_id: 0x5b38da6a701c568545dcfcb03fcb875f56beddc4,
        todoID: 1,
        title: "My First Todo Item",
        description: "This is my very first todo item in 2024",
        isDone: false,
        status: 0,
      });
    });
  });
});
