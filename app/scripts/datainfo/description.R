# Description module

description.heartFailureDescription <- '
  <h3>Predykcja zgonu w wyniku niewydolności serca</h3>
  <hr>
  <p>Choroby układu krwionośnego są najczęstszą przyczyną śmierci na świecie, zabijając rocznie ok 18 mln osób, co przekłada się na ponad 30% śmierci rocznie. Niewydolność serca jest częstym przypadkiem choroby układu krążenia. Ten zbiór danych zawiera symptomy, które mogą pomóc prognozować śmiertelny przypadek niewydolności.</p>
  <p>Większość chorób układu krwionośnego można powstrzymać poprzez propagowanie zdrowego trybu życia i zastopowanie tzw. faktorów ryzyka, takich jak palenie, niezdrowa dieta, brak aktywności, nadużywanie alkoholu itd.</p>
  <p>Ludzie z niewydolnością układu krążenia lub zagrożeni nią potrzebują wczesnej diagnozy oraz leczenia, w czym może pomóc model uczenia maszynowego.</p>
  <h4>Zbiór zawiera 12 właściwości klinicznych:</h4>
  <ul>
    <li>wiek: wiek pacjenta (lata)</li>
    <li>anemia: obniżona ilość czerwonych krwinek w hemoglobinie (tak/nie)</li>
    <li>wysokie ciśnienie krwi: czy pacjent ma wysokie ciśnienie krwi (tak/nie)</li>
    <li>fosfokinaza kreatynowa (CPK): poziom enzymu CPK we krwi (mcg/L)</li>
    <li>cukrzyca: czy pacjent jest cukrzykiem (tak/nie)</li>
    <li>frakcja wyrzutowa: procent krwi wypompowywany przez serce przy każdym skurczu (procent * 100)</li>
    <li>płytki krwi: płytki we krwi (liczba płytek * 100/mL)</li>
    <li>płeć: mężczyzna/kobieta</li>
    <li>kreatynina: poziom kreatyniny we krwi (mg/dL)</li>
    <li>sód: poziom sodu we krwi (mEq/L)</li>
    <li>palenie: czy pacjent jest palaczem (tak/nie)</li>
    <li>śmierć: czy nastąpił zgon pacjenta (tak/nie)</li>
  </ul>
'

description.diabetesDescription <- '
  <h3>Predykcja cukrzycy</h4>
  <hr>
  <h4>O danych</h4>
  <p>Zbiór danych zawiera znaki i symptomy noworozpoznanych lub nie diabetyków. Zostały zebrane poprzez bezpośrednie ankiety od pacjentów ze Szpitala Diabetologicznego w Sylhet, w Bangladeszu i zostały zatwierdzone przez lekarza.</p>
  <h4>Właściwości zbioru</h4>
  <p>Zbiór danych zawiera po 15 właściwości i jedną dodatkową o nazwie klasa, stwierdzającą czy badany pacjent jest cukrzykiem.</p>
  <ul>
    <li>1. Wiek: Age in years ranging from (20years to 65 years)</li>
    <li>2. Płeć: mężczyzna/kobieta</li>
    <li>3. Poliuria: tak/nie</li>
    <li>4. Polidypsja: tak/nie</li>
    <li>5. Nagła utrata wagi: tak/nie</li>
    <li>6. Słabość: tak/nie</li>
    <li>7. Polifagia: tak/nie</li>
    <li>8. Pleśniawki narządów płciowych: tak/nie</li>
    <li>9. Rozmyte widzenie: tak/nie</li>
    <li>10. Swędzenie: tak/nie</li>
    <li>11. Drażliwość: tak/nie</li>
    <li>12. Opóźnione gojenie: tak/nie</li>
    <li>13. Częściowy niedowład: tak/nie</li>
    <li>14. Sztywność mięśni: tak/nie</li>
    <li>15. Alopecja: tak/nie</li>
    <li>16. Otyłość: tak/nie</li>
  </ul>
  Klasa: pozytywny / negatywny
'

description.describeData <- function (key) {
  switch(
    key,
    'heartFailure' = description.heartFailureDescription,
    'diabetes' = description.diabetesDescription
  )
}

