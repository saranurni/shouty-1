import Person from "../models/Person";

describe("Person", () => {
  let network;
  let person;

  let subscribeSpy;
  let broadcastSpy;

  beforeEach(() => {
    network = {
      range: 15,
      subscribe() {},
      broadcast() {},
    };

    person = new Person({ name: "John", network });

    subscribeSpy = jest.spyOn(network, "subscribe");
    broadcastSpy = jest.spyOn(network, "broadcast");
  });

  it("subscribes to the network", () => {
    // The method will not be called unless we instantiate a new Person IN THIS TEST
    const newPerson = new Person({ name: "James", network });

    expect(subscribeSpy).toHaveBeenCalledWith(newPerson);
  });

  it("broadcasts a message to the network", () => {
    const message = "Free 🥯s!";

    person.shout(message);

    expect(broadcastSpy).toHaveBeenCalledWith(message);
  });

  it("moves to position", () => {
    const position = 10;

    person.moveTo(position);

    expect(person.position).toBe(position);
  });

  it("hears a message from the network when in range", () => {
    const inRangeMsg = "Free 🥯s!";

    // Move person into range of network
    person.moveTo(10);

    person.hear(inRangeMsg);

    expect(person.messages).toEqual([inRangeMsg]);
  });

  it("doesn't hear a message from the network when out of range", () => {
    const inRangeMsg = "Free 🥯s!";

    // Move person out of range of network
    person.moveTo(100);

    person.hear(inRangeMsg);

    expect(person.messages).toEqual(expect.not.arrayContaining([inRangeMsg]));
  });
});
