package;

import js.Browser;
import react.ReactDOM;
import react.ReactMacro.jsx;
import components.UserForm;

class Main {
	public static function main() {
		ReactDOM.render(
			jsx('
				<$UserForm />
			'),
			Browser.document.getElementById('root')
		);
	}
}
