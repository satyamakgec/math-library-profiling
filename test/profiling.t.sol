// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import { TestUtils } from "../src/utils/TestUtils.sol";

import {FixedPointMathLib} from "../src/FixedPointMathLib.sol";
import {TypedFixedPointMathLib, UFixedPoint, Exponent } from "../src/TypedFixedPointMathLib.sol";
import {FixedPoint} from "../src/FixedPoint.sol";

contract FixedPointMathLibTest is TestUtils {

    function testMulWadDown() public {

        startMeasuringGas("Duck");
        assertEq(FixedPointMathLib.mulWadDown(2.5e18, 0.5e18), 1.25e18);
        stopMeasuringGas();

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-mulWadDown-1");
        assertEq(FixedPointMathLib.mulWadDown(2.5e18, 0.5e18), 1.25e18);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib mulWadDown 1");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.mulWadDown(UFixedPoint.wrap(2.5e18), UFixedPoint.wrap(0.5e18))),  1.25e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-mulDown-1");
        assertEq(FixedPoint.mulDown(2.5e18, 0.5e18), 1.25e18);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-mulWadDown-2");
        assertEq(FixedPointMathLib.mulWadDown(3e18, 1e18), 3e18);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib mulWadDown 2");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.mulWadDown(UFixedPoint.wrap(3e18), UFixedPoint.wrap(1e18))),  3e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-mulDown-2");
        assertEq(FixedPoint.mulDown(3e18, 1e18), 3e18);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-mulWadDown-3");
        assertEq(FixedPointMathLib.mulWadDown(369, 271), 0);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib mulWadDown 3");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.mulWadDown(UFixedPoint.wrap(369), UFixedPoint.wrap(271))),  0);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-mulDown-3");
        assertEq(FixedPoint.mulDown(369, 271), 0);
        stopMeasuringGas();

        //------------------------------------------------------------//
    }

    function testMulWadDownEdgeCases() public {

        startMeasuringGas("Duck");
        assertEq(FixedPointMathLib.mulWadDown(0, 1e18), 0);
        stopMeasuringGas();

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-mulWadDown-edgecases-1");
        assertEq(FixedPointMathLib.mulWadDown(0, 1e18), 0);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib mulWadDown edgecase 1");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.mulWadDown(UFixedPoint.wrap(0), UFixedPoint.wrap(1e18))), 0);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-mulDown-edgecases-1");
        assertEq(FixedPoint.mulDown(0, 1e18), 0);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-mulWadDown-edgecases-2");
        assertEq(FixedPointMathLib.mulWadDown(1e18, 0), 0);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib mulWadDown edgecase 2");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.mulWadDown(UFixedPoint.wrap(1e18), UFixedPoint.wrap(0))), 0);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-mulDown-edgecases-2");
        assertEq(FixedPoint.mulDown(1e18, 0), 0);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-mulWadDown-edgecases-3");
        assertEq(FixedPointMathLib.mulWadDown(0, 0), 0);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib mulWadDown edgecase 3");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.mulWadDown(UFixedPoint.wrap(0), UFixedPoint.wrap(0))), 0);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-mulDown-edgecases-3");
        assertEq(FixedPoint.mulDown(0, 0), 0);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

    }

    function testMulWadUp() public {

        startMeasuringGas("Duck");
        assertEq(FixedPointMathLib.mulWadUp(2.5e18, 0.5e18), 1.25e18);
        stopMeasuringGas();

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-mulWadUp-1");
        assertEq(FixedPointMathLib.mulWadUp(2.5e18, 0.5e18), 1.25e18);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib mulWadUp 1");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.mulWadUp(UFixedPoint.wrap(2.5e18), UFixedPoint.wrap(0.5e18))), 1.25e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-mulUp-1");
        assertEq(FixedPoint.mulUp(2.5e18, 0.5e18), 1.25e18);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-mulWadUp-2");
        assertEq(FixedPointMathLib.mulWadUp(3e18, 1e18), 3e18);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib mulWadUp 2");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.mulWadUp(UFixedPoint.wrap(3e18), UFixedPoint.wrap(1e18))), 3e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-mulUp-2");
        assertEq(FixedPoint.mulUp(3e18, 1e18), 3e18);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-mulWadUp-3");
        assertEq(FixedPointMathLib.mulWadUp(369, 271), 1);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib mulWadUp 3");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.mulWadUp(UFixedPoint.wrap(369), UFixedPoint.wrap(271))), 1);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-mulUp-3");
        assertEq(FixedPoint.mulUp(369, 271), 1);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//
    }

    function testDivWadDown() public {

        startMeasuringGas("Duck");
        assertEq(FixedPointMathLib.divWadDown(1.25e18, 0.5e18), 2.5e18);
        stopMeasuringGas();

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-dipWadDown-1");
        assertEq(FixedPointMathLib.divWadDown(1.25e18, 0.5e18), 2.5e18);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib dipWadDown 1");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.divWadDown(UFixedPoint.wrap(1.25e18), UFixedPoint.wrap(0.5e18))), 2.5e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-divDown-1");
        assertEq(FixedPoint.divDown(1.25e18, 0.5e18), 2.5e18);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-dipWadDown-2");
        assertEq(FixedPointMathLib.divWadDown(3e18, 1e18), 3e18);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib dipWadDown 2");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.divWadDown(UFixedPoint.wrap(3e18), UFixedPoint.wrap(1e18))), 3e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-divDown-2");
        assertEq(FixedPoint.divDown(3e18, 1e18), 3e18);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-dipWadDown-3");
        assertEq(FixedPointMathLib.divWadDown(2, 100000000000000e18), 0);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib dipWadDown 3");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.divWadDown(UFixedPoint.wrap(2), UFixedPoint.wrap(100000000000000e18))), 0);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-divDown-3");
        assertEq(FixedPoint.divDown(2, 100000000000000e18), 0);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//
    }


    function testDivWadUp() public {

        startMeasuringGas("Duck");
        assertEq(FixedPointMathLib.divWadUp(1.25e18, 0.5e18), 2.5e18);
        stopMeasuringGas();

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-dipWadUP-1");
        assertEq(FixedPointMathLib.divWadUp(1.25e18, 0.5e18), 2.5e18);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib divWadUp 1");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.divWadUp(UFixedPoint.wrap(1.25e18), UFixedPoint.wrap(0.5e18))), 2.5e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-divUp-1");
        assertEq(FixedPoint.divUp(1.25e18, 0.5e18), 2.5e18);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-dipWadUp-2");
        assertEq(FixedPointMathLib.divWadUp(3e18, 1e18), 3e18);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib divWadUp 2");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.divWadUp(UFixedPoint.wrap(3e18), UFixedPoint.wrap(1e18))), 3e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-divUp-2");
        assertEq(FixedPoint.divUp(3e18, 1e18), 3e18);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-dipWadUp-3");
        assertEq(FixedPointMathLib.divWadUp(2, 100000000000000e18), 1);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib divWadUp 3");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.divWadUp(UFixedPoint.wrap(2), UFixedPoint.wrap(100000000000000e18))), 1);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-divUp-3");
        assertEq(FixedPoint.divUp(2, 100000000000000e18), 1);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//
    }

    function testRPow() public {

        startMeasuringGas("Duck");
        assertEq(FixedPointMathLib.rpow(2e18, 2, 1e18), 4e18);
        stopMeasuringGas();

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-rpow-1");
        assertEq(FixedPointMathLib.rpow(2e18, 2, 1e18), 4e18);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib pow 1");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.pow(UFixedPoint.wrap(2e18), Exponent.wrap(2))), 4e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-powUp-1");
        assertEq(FixedPoint.powUp(2e18, 2e18), 4e18);
        stopMeasuringGas();

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-rpow-2");
        assertEq(FixedPointMathLib.rpow(2e27, 2, 1e27), 4e27);
        stopMeasuringGas();

        startMeasuringGas("TypedFixedPointMathLib pow 2");
        assertEq(UFixedPoint.unwrap(TypedFixedPointMathLib.pow(UFixedPoint.wrap(2e18), Exponent.wrap(8))), 256e18);
        stopMeasuringGas();

        startMeasuringGas("FixedPoint-powUp-2");
        // Does not handle the arbitary scale value as FixedPointMathLib does in the above assert statement
        // It is not precise as well it should provides 256e18
        assertEq(FixedPoint.powUp(2e18, 8e18), 256000000000002559135);  
        stopMeasuringGas();
        emit log_named_uint("Fixed Point can't handle the arbitary scale factory only works for e18, also it is not precise if the pow is not 1,2,4", 256000000000002559135);

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

        startMeasuringGas("FixedPointMathLib-rpow-3");
        assertEq(FixedPointMathLib.rpow(8, 3, 1), 512);
        stopMeasuringGas();


        startMeasuringGas("FixedPoint-powUp-3");
        // It doesn't work on the unscaled values so above assert will revert
        // assertEq(FixedPoint.powUp(8, 3), 512);
        stopMeasuringGas();
        emit log_named_uint("Fixed Point can't handle non scale values and the provided value would fail gives", 1000000000000009883);

        emit log_named_string("    ","------------------------------------------------------");

        //------------------------------------------------------------//

    }

    function testSqrt() public {

        startMeasuringGas("Duck");
        assertEq(FixedPointMathLib.sqrt(0), 0);
        stopMeasuringGas();

        startMeasuringGas("FixedPointMathLib-sqrt-1");
        assertEq(FixedPointMathLib.sqrt(0), 0);
        stopMeasuringGas();

        // startMeasuringGas("FixedPoint-powDown-1");
        // assertEq(FixedPoint.powDown(0, 0), 0);
        // stopMeasuringGas();

        // assertEq(FixedPointMathLib.sqrt(1), 1);
        // assertEq(FixedPointMathLib.sqrt(2704), 52);
        // assertEq(FixedPointMathLib.sqrt(110889), 333);
        // assertEq(FixedPointMathLib.sqrt(32239684), 5678);
    }
}
