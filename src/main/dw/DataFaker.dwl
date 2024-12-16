%dw 2.0
import java!org::example::DataFakerWrapper

fun fake (provider: String, function: String) =
  DataFakerWrapper::fake(provider, function)
