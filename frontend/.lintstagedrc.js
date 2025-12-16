module.exports = {
  '*.{js,ts}': ['eslint --fix', 'prettier --write'],
  '*.vue': ['eslint --fix', 'prettier --write', 'stylelint --fix'],
  '*.{css,scss}': ['stylelint --fix', 'prettier --write'],
  '*.{json,md}': ['prettier --write'],
};
