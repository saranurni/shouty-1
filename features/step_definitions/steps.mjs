import { Given, Then, When } from "@cucumber/cucumber";
import { expect } from "expect";
import Network from "../../src/models/Network.js";
import Person from "../../src/models/Person.js";

Given("Lucy is located {float} meters away from Sean", function (distance) {
  this.network = new Network();
  this.listener = new Person({
    name: "Lucy",
    network: this.network,
    position: distance,
  });
  this.shouter = new Person({ name: "Sean", network: this.network });
});

When("Sean shouts {string}", function (message) {
  this.shouter.shout(message);
});

Then("Lucy hears Sean's shout", function () {
  expect(this.listener.messages).toEqual(this.shouter.shouts);
});
