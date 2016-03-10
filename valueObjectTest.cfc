/**
* My xUnit Test
*/
component extends="testbox.system.BaseSpec"{
	
/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all test cases
	function beforeTests(){
	}

	// executes after all test cases
	function afterTests(){
	}

	// executes before every test case
	function setup( currentMethod ){
	}

	// executes after every test case
	function teardown( currentMethod ){
	}

/*********************************** TEST CASES BELOW ***********************************/
	
	// Remember that test cases MUST start or end with the keyword 'test'
	function basicTest(){
		basic = new examples.basic("someValue");
		basicCopy = new examples.basic("someValue");
		basic2 = new examples.basic("otherValue");
		expect(basic.toString()).toBe("someValue");
		expect(basic.equals(basic)).toBeTrue();
		expect(basic.equals(basicCopy)).toBeTrue();
		expect(basic.equals(basic2)).toBeFalse();
		expect(basic.length()).toBe(9);
	}

	function complexTest(){
		complex = new examples.complex("first", "second");
		complexCopy = new examples.complex("first", "second");
		complex2 = new examples.complex("third","fourth");
		expect(complex.equals(complex)).toBeTrue();
		expect(complex.equals(complexCopy)).toBeTrue();
		expect(complex.equals(complex2)).toBeFalse();
		expect(function(){
			complex.toString();
		}).toThrow(message="This value object has more than one property so we cannot return it to string. Create your own ToString method in the value object");expect(function(){
			complex.length();
		}).toThrow(message="This value object has more than one property so we cannot return it to string. Create your own ToString method in the value object");

	}

	function complexValueTest(){
		complex = new examples.complexValue({first:"first", second:"second"});
		complexCopy = new examples.complexValue({first:"first", second:"second"});
		complex2 = new examples.complexValue({first:"third", second:"fourth"});
		expect(complex.equals(complex)).toBeTrue();
		expect(complex.equals(complexCopy)).toBeTrue();
		expect(complex.equals(complex2)).toBeFalse();
		expect(function(){
			complex.toString();
		}).toThrow(message="The value was not a simple value and therefore cannot be converted to a string. Provide your own toString method in the value object");expect(function(){
			complex.length();
		}).toThrow(message="The value was not a simple value and therefore cannot be converted to a string. Provide your own toString method in the value object");

	}

	function serializetionTest(){
		complex = new examples.complexValue({first:"first", second:"second"});
		var serialized = complex.serialize();
		expect(serialized).toBe(serialize(complex.toStruct()));
	}
	
}
