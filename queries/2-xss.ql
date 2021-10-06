/**
 * @name Empty scope
 * @kind path-problem
 * @problem.severity warning
 * @id python/example/empty-scope
 */

import python
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.TaintTracking
import semmle.python.dataflow.new.RemoteFlowSources
import semmle.python.Concepts
import DataFlow::PathGraph

class XSS extends TaintTracking::Configuration {
    XSS() { this = "XSS" }
  
    override predicate isSource(DataFlow::Node source) {
      source instanceof RemoteFlowSource
    }
  
    override predicate isSink(DataFlow::Node sink) {
      sink instanceof HTTP::Server::HttpResponse
    }
}

from DataFlow::PathNode source, DataFlow::PathNode sink, XSS config
where config.hasFlowPath(source, sink)
select sink.getNode(), source, sink, "XSS"
