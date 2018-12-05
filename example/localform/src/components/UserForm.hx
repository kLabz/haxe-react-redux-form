package components;

import react.ReactComponent;
import react.ReactMacro.jsx;
import react.redux.form.LocalForm;
import react.redux.form.Control;
import react.redux.form.Errors;
import react.redux.form.Field;

class UserForm extends ReactComponent {
	static var initialUser = {
		firstName: '',
		lastName: '',
		bag: 'paper'
	};

	override public function render() {
		return jsx('
			<$LocalForm onSubmit=${handleSubmit} initialState=${initialUser} model="user">
				<div>
					<label>First name:</label>
					<$ControlText
						model="user.firstName"
						validators=${{len: function(val) return val.length > 8}}
						mapProps=${{
							className: function(e) return e.fieldValue.focus ? 'focused' : ''
						}}
					/>
					<$Errors model=".firstName" messages=${{
						len: 'len must be > 8'
					}} />
				</div>

				<div>
					<label>Last name:</label>
					<$Control model="user.lastName" validators=${{
						required: function(val) return val != null && val.length > 0
					}} />
				</div>

				<$Field model="user.bag">
					<label>
						<input type="radio" value="plastic" />
						<span>Plastic</span>
					</label>
					<label>
						<input type="radio" value="paper" />
						<span>Paper</span>
					</label>
				</$Field>

				<$ControlButton model="user" disabled=${{valid: false}}>
					Finish registration!
				</$ControlButton>

				<$ControlReset model="user" />
			</$LocalForm>
		');
	}

	function handleSubmit(user, _) {
		trace('submit', user);
	}
}
