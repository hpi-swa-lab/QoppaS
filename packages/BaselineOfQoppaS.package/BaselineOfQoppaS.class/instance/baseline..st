as yet unclassified
baseline: spec
  <baseline>
	spec
		for: #common
		do: [
			spec
				baseline: 'Ohm' with: [ spec repository:  'github://hpi-swa/ohm-s/packages' ];
				
				package: 'QoppaS-Core' with: [spec requires: #('libraries')];
				package: 'QoppaS-Tests' with: [spec requires: #('QuoppaS-Core')];
				package: 'QoppaS-Repl' with: [spec requires: #('QuoppaS-Core')];
				yourself.
			spec
				group: 'default' with: #('QoppaS-Core' 'ui');
				group: 'ui' with: #('QoppaS-Repl');
				group: 'libraries' with: #('Ohm');
				group: 'tests' with: #('QuoppaS-Tests');
				group: 'TravisCI' with: #('tests') ];
				yourself