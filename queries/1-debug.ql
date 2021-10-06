/**
 * @name debug flask
 * @kind problem
 * @problem.severity warning
 * @id python/example/debug flask
 */

import python
import semmle.python.ApiGraphs

from
  API::Node n, DataFlow::CallCfgNode call
where
  n = API::moduleImport("flask")
          .getMember("Flask").getReturn()
          .getMember("run")
  and
  call = n.getACall()
  and
  call.getArgByName("debug").asExpr().(ImmutableLiteral).booleanValue() = true
select call, "flask app runs in debug mode", "s"
