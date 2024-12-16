%dw 2.0
import java!org::example::DataFakerWrapper

/**
* Describes the `fake` function purpose.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `provider` | String | 
* | `function` | String | 
* |===
*
* === Example
*
* This example shows how the `fake` function behaves under different inputs.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/java
* ---
* 
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
*
* ----
*
*/
fun fake (provider: String, function: String) =
  DataFakerWrapper::fake(provider, function)
