/**
 * Contains customizations to the standard library.
 *
 * This module is imported by `python.qll`, so any customizations defined here automatically
 * apply to all queries.
 *
 * Typical examples of customizations include adding new subclasses of abstract classes such as
 * the `RemoteFlowSource::Range` and `AdditionalTaintStep` classes associated with the security
 * queries to model frameworks that are not covered by the standard library.
 */

import python
import semmle.python.Concepts
import semmle.python.ApiGraphs

class ClichouseCALL extends SqlExecution::Range, DataFlow::CallCfgNode {
  ClichouseCALL() {
    this =
      API::moduleImport("clickhouse_driver")
          .getMember("Client")
          .getReturn()
          .getMember("execute")
          .getACall()
  }

  override DataFlow::Node getSql() { result = this.getArg(0) }
}
