import Foundation
import ImageSerializationPlugin
import webp

/// A serializer class for handling WebP image format encoding and decoding.
///
/// The `WEBPImageSerializer` class conforms to the `ImageSerializationPlugin` protocol and provides functionality
/// to encode and decode images in the WebP format. It integrates with the plugin-based image serialization
/// architecture and uses the WebP library to perform the conversions.
public class WEBPImageSerializer: ImageSerializationPlugin {
  
  /// Initializes a new instance of the `WEBPImageSerializer`.
  ///
  /// The initializer is required to conform to the `ImageSerializationPlugin` protocol.
  required public init() {}
  
  /// The image format handled by this serializer, which is `webp`.
  static public let imageFormat: ImageSerializationFormat = .plugins("webp")
  
  /// A unique identifier for this serializer plugin.
  static public let identifier: String = "ImageSerializationPlugin.webp"
  
  /// Encodes a `SnapImage` into WebP format.
  ///
  /// This method converts the provided `SnapImage` into WebP format using the WebP encoder.
  ///
  /// - Parameter image: The image to be encoded.
  /// - Returns: A `Data` object containing the encoded WebP image, or `nil` if the encoding fails.
  public func encodeImage(_ image: SnapImage) -> Data? {
    try? WebPEncoder().encode(image, config: .preset(.picture, quality: 80))
  }
  
  /// Decodes WebP data into a `SnapImage`.
  ///
  /// This method converts the provided WebP data into a `SnapImage`.
  ///
  /// - Parameter data: The WebP data to be decoded.
  /// - Returns: A `SnapImage` created from the data, or `nil` if the decoding fails.
  public func decodeImage(_ data: Data) -> SnapImage? {
    try? WebPDecoder().decode(toImage: data, options: WebpDecoderOptions())
  }
}
