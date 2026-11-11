import js.Browser;
import js.html.ButtonElement;
import js.html.TextAreaElement;
import js.html.IFrameElement;

class Main {
    static function main() {
        // Wait for the window DOM to load safely
        Browser.window.onload = function(event) {
            
            // Grab references to your HTML elements by their IDs
            var loadButton = cast(Browser.document.getElementById("load-btn"), ButtonElement);
            var htmlInput = cast(Browser.document.getElementById("html-input"), TextAreaElement);
            var previewFrame = cast(Browser.document.getElementById("preview-frame"), IFrameElement);

            // Bind the click event to the button
            loadButton.onclick = function(e) {
                // Get raw text/HTML from our textarea
                var rawHtml = htmlInput.value;

                // Safely load the raw content directly into the iframe's document
                var doc = previewFrame.contentDocument;
                if (doc != null) {
                    doc.open();
                    doc.write(rawHtml);
                    doc.close();
                }
            };
        };
    }
}
