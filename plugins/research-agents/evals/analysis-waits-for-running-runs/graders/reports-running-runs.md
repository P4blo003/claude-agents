---
type: llm
---

The reply is the research coordinator's summary when the PI resumes a project whose run log shows 18 finished runs and two runs, r19 and r20, still marked running.

PASS if the reply says that r19 and r20 are still running and that the analysis waits until every run it needs has a final status (for example by having experiment-engineer collect them, or by asking the PI).

FAIL if the reply starts the analysis, proposes to run it now on the 18 finished runs without flagging r19 and r20, or treats r19 and r20 as finished.
