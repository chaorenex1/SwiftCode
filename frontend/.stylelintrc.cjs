module.exports = {
  extends: ['stylelint-config-tailwindcss'],
  rules: {
    // Tailwind CSS specific rules
    'at-rule-no-unknown': [
      true,
      {
        ignoreAtRules: ['tailwind', 'apply', 'variants', 'responsive', 'screen', 'layer', 'theme'],
      },
    ],

    // Disable strict rules
    'selector-class-pattern': null,
    'custom-property-pattern': null,
    'keyframes-name-pattern': null,
    'no-descending-specificity': null,
    'property-no-vendor-prefix': null,
    'value-no-vendor-prefix': null,
  },
  ignoreFiles: ['**/*.js', '**/*.jsx', '**/*.ts', '**/*.tsx', '**/*.json', '**/*.vue'],
};
