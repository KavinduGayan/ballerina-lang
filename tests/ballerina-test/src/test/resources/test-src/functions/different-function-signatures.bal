//------------ Testing a function with all types of parameters ---------

function functionWithAllTypesParams(int a, float b, string c = "John", int d = 5, string e = "Doe", int... z)
        returns (int, float, string, int, string, int[]) {
    return (a, b, c, d, e, z);
}

function testInvokeFunctionInOrder1() returns (int, float, string, int, string, int[]) {
    return functionWithAllTypesParams(10, 20.0, c="Alex", d=30, e="Bob", 40, 50, 60);
}

function testInvokeFunctionInOrder2() returns (int, float, string, int, string, int[]) {
    int[] array = [40, 50, 60];
    return functionWithAllTypesParams(10, 20.0, c="Alex", d=30, e="Bob", ...array);
}

function testInvokeFunctionInMixOrder1() returns (int, float, string, int, string, int[]) {
    return functionWithAllTypesParams(10, e="Bob", 20.0, c="Alex", 40, 50, d=30, 60);
}

function testInvokeFunctionInMixOrder2() returns (int, float, string, int, string, int[]) {
    int[] array = [40, 50, 60];
    return functionWithAllTypesParams(10, e="Bob", 20.0, c="Alex", ...array, d=30);
}

function testInvokeFunctionWithoutRestArgs() returns (int, float, string, int, string, int[]) {
    return functionWithAllTypesParams(10, e="Bob", 20.0, c="Alex", d=30);
}

function testInvokeFunctionWithoutSomeNamedArgs() returns (int, float, string, int, string, int[]) {
    return functionWithAllTypesParams(c="Alex", 10, 20.0);
}

function testInvokeFunctionWithRequiredArgsOnly() returns (int, float, string, int, string, int[]) {
    return functionWithAllTypesParams(10, 20.0);
}

function testInvokeFunctionWithRequiredAndRestArgs() returns (int, float, string, int, string, int[]) {
    return functionWithAllTypesParams(10, 20.0, 40, 50, 60);
}

function funcInvocAsRestArgs() returns (int, float, string, int, string, int[]) {
    return functionWithAllTypesParams(10, 20.0, c="Alex", d=30, e="Bob", ...getIntArray());
}

function getIntArray() returns (int[]) {
    return [1,2,3,4];
}

//------------- Testing a function having required and rest parameters --------

function functionWithoutRestParams(int a, float b, string c = "John", int d = 5, string e = "Doe") returns
            (int, float, string, int, string) {
    return (a, b, c, d, e);
}

function testInvokeFuncWithoutRestParams() returns (int, float, string, int, string) {
    return functionWithoutRestParams(10, e="Bob", 20.0, d=30);
}

//------------- Testing a function having only named parameters --------


function functionWithOnlyNamedParams(int a=5, float b=6.0, string c = "John", int d = 7, string e = "Doe")
                                                                                                    returns (int, float, string, int, string) {
    return (a, b, c, d, e);
}

function testInvokeFuncWithOnlyNamedParams1() returns (int, float, string, int, string) {
    return functionWithOnlyNamedParams(b = 20, e="Bob", d=30, a=10 , c="Alex");
}

function testInvokeFuncWithOnlyNamedParams2() returns (int, float, string, int, string) {
    return functionWithOnlyNamedParams(e="Bob", d=30, c="Alex");
}

function testInvokeFuncWithOnlyNamedParams3() returns (int, float, string, int, string) {
    return functionWithOnlyNamedParams();
}

//------------- Testing a function having only rest parameters --------

function functionWithOnlyRestParam(int... z) returns (int[]) {
    return z;
}

function testInvokeFuncWithOnlyRestParam1() returns (int[]) {
    return functionWithOnlyRestParam();
}

function testInvokeFuncWithOnlyRestParam2() returns (int[]) {
    return functionWithOnlyRestParam(10, 20, 30);
}

function testInvokeFuncWithOnlyRestParam3() returns (int[]) {
    int[] a = [10, 20, 30];
    return functionWithOnlyRestParam(...a);
}

//------------- Testing a function with rest parameter of any type --------

function functionAnyRestParam(any... z) returns (any[]) {
    return z;
}

function testInvokeFuncWithAnyRestParam1() returns (any[]) {
    int[] a = [10, 20, 30];
    json j = {"name":"John"};
    return functionAnyRestParam(a, j);
}

// ------------------- Test function signature with union types for default parameter

function funcWithUnionTypedDefaultParam(string|int? s = "John") returns string|int? {
    return s;
}

function testFuncWithUnionTypedDefaultParam() returns json {
    return funcWithUnionTypedDefaultParam();
}


// ------------------- Test function signature with null as default parameter value

function funcWithNilDefaultParamExpr_1(string? s = null) returns string? {
    return s;
}

type Person {
    int a;
};

function funcWithNilDefaultParamExpr_2(Person? p = ()) returns Person? {
    return p;
}

function testFuncWithNilDefaultParamExpr() returns (any, any) {
    return (funcWithNilDefaultParamExpr_1(), funcWithNilDefaultParamExpr_2());
}