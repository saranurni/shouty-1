import { Given, Then, When } from "@cucumber/cucumber";
import { expect } from "expect";
import Network from "../../src/models/Network.js";
import Person from "../../src/models/Person.js";

Given("the range is {float}", function (range) {
  this.network = new Network(range);
});

Given("Sean is located at {float}", function (_) {
  this.shouter = new Person({ name: "Sean", network: this.network });
});

Given("Lucy is located at {float}", function (position) {
  this.listener = new Person({
    name: "Lucy",
    network: this.network,
    position,
  });
});

When("Sean shouts {string}", function (message) {
  this.shouter.shout(message);
});

Then("Lucy hears Sean's shout", function () {
  expect(this.listener.messages).toEqual(this.shouter.shouts);
});
