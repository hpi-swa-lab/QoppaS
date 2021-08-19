as yet unclassified
baseline: spec
  <baseline>
	spec
		for: #common
		do: [
			spec
				baseline: 'Ohm' with: [ spec repository: 'github://hpi-swa/Ohm-S:master/packages' ];
				
				package: 'QoppaS-Core' with: [spec requires: #('libraries')];
				package: 'QoppaS-Repl' with: [spec requires: #('QoppaS-Core')];
				package: 'QoppaS-Tests' with: [spec requires: #('QoppaS-Core' 'QoppaS-Repl')];
				yourself.
			spec
				group: 'default' with: #('QoppaS-Core' 'ui');
				group: 'ui' with: #('QoppaS-Repl');
				group: 'libraries' with: #('Ohm');
				group: 'tests' with: #('QoppaS-Tests');
				group: 'TravisCI' with: #('tests') ];
				yourself
