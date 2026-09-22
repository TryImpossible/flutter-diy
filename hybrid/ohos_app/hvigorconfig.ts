import path from 'path'
import { injectNativeModules } from 'flutter-hvigor-plugin'

injectNativeModules(__dirname, path.resolve(__dirname, '../flutter_module'), 1)
