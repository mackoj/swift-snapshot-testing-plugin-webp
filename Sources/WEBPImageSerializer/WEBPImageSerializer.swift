import Foundation
import ImageSerializationPlugin
import webp

public class WEBPImageSerializer: ImageSerializationPlugin {
  required public init() {}
  static public let imageFormat: ImageSerializationFormat = .plugins("webp")
  static public let identifier: String = "ImageSerializationPlugin.webp"
  
  public func encodeImage(_ image: SnapImage) -> Data? {
    try? WebPEncoder().encode(image, config: .preset(.picture, quality: 80))
  }
  
  public func decodeImage(_ data: Data) -> SnapImage? {
    try? WebPDecoder().decode(toImage: data, options: WebpDecoderOptions())
  }
}
