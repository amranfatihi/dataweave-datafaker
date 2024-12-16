%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from DataFaker

---
"FakerSuite" describedBy [
    "Should generate random name" in do {
                fake("name","fullName")
                must notBeNull()
    }
]
