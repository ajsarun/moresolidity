// SPDX-License-Identifier: MIT
pragma solidity >=0.6.6 < 0.8.0;
/*
Here is an example where the Zoo contract calls a contract the implements
the Animal interface.
*/
interface Animal {
    enum FoodType { MEAT, PLANT, ANY }

    struct Position {
        uint x;
        uint y;
    }


    // All functions must be external
    function move(uint x, uint y) external;
    function eat(FoodType foodType) external returns (bool);
    
}

contract Wolf is Animal {
    Position public position;

    

    function move(uint x, uint y) external override {
        position.x = x;
        position.y = y;
    }

    function eat(FoodType foodType) external override returns (bool) {
        return foodType == FoodType.MEAT;
    }
}

contract Zoo {
    function feed(address _animal, Animal.FoodType foodType) public returns (bool) {
        Animal animal = Animal(_animal);

        
        return animal.eat(foodType);
    }
}