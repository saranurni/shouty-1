import { Before, Given, Then, When } from "@cucumber/cucumber";
import { expect } from "expect";
import Network from "../../src/models/Network.js";
import Person from "../../src/models/Person.js";

Before(function () {
  this.persons = {};
});

Given("the range is {float}", function (range) {
  this.network = new Network(range);
});

Given(
  "{person} is located/standing/positioned at {float}",
  function (name, position) {
    this.persons[name.toLowerCase()] = new Person({
      name,
      network: this.network,
      position,
    });
  }
);

When("{shouter} shouts {string}", function (shouter, message) {
  this.persons[shouter.toLowerCase()].shout(message);
});

Then("{listener} hears {shouter}'s shout", function (listener, shouter) {
  expect(this.persons[listener.toLowerCase()].messages).toEqual(
    this.persons[shouter.toLowerCase()].messages
  );
});