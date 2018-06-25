FOR /F %%i IN ('pip freeze ^| FindStr pycodestyle') DO SET val=%%i

IF "%val%" == "" (
	pip install pycodestyle
)

pycodestyle . --ignore=W293 --max-line-length=120 > "pep8 errors.txt"
