describe "HPI Grade Calculation", ->
  it "sum up a single grade", ->
    grades = [[2, 3]]
    ret = hpi.sumupGrades(grades, 10, 0)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 3
    expect(ret[2]).toEqual 3

  it "sum up two equal grades", ->
    grades = [[2, 3], [2, 3]]
    ret = hpi.sumupGrades(grades, 10, 0)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 6
    expect(ret[2]).toEqual 6

  it "sum up two different grades", ->
    grades = [[1, 3], [3, 3]]
    ret = hpi.sumupGrades(grades, 10, 0)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 6
    expect(ret[2]).toEqual 6

  it "sum up three grades with different lp", ->
    grades = [[1, 6], [3, 3], [3, 3]]
    ret = hpi.sumupGrades(grades, 12, 0)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 12
    expect(ret[2]).toEqual 12

  it "sum up three grades with different lp - aligned", ->
    grades = [[1, 6], [4, 3], [4, 3]]
    ret = hpi.sumupGrades(grades, 9, 0)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 9
    expect(ret[2]).toEqual 9

  it "sum up three grades with different lp - not aligned", ->
    grades = [[1, 6], [4, 6], [4, 6]]
    ret = hpi.sumupGrades(grades, 9, 0)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 9
    expect(ret[2]).toEqual 9

  it "sum up three grades with different lp - not aligned, unsorted", ->
    grades = [[4, 6], [1, 6], [4, 6]]
    ret = hpi.sumupGrades(grades, 9, 0)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 9
    expect(ret[2]).toEqual 9

  it "sum up weighted one grade", ->
    grades = [[4, 3]]
    ret = hpi.sumupGrades(grades, 9, 3)
    expect(ret[0]).toEqual 4
    expect(ret[1]).toEqual 9
    expect(ret[2]).toEqual 3

  it "sum up weighted one grade - not aligned", ->
    grades = [[4, 6]]
    ret = hpi.sumupGrades(grades, 9, 3)
    expect(ret[0]).toEqual 4
    expect(ret[1]).toEqual 12
    expect(ret[2]).toEqual 6

  it "sum up some more weighted grades", ->
    grades = [[3, 6], [1, 3], [3, 3]]
    ret = hpi.sumupGrades(grades, 12, 3)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 18
    expect(ret[2]).toEqual 12

  it "sum up some more weighted grades with useless grade", ->
    grades = [[3, 6], [1, 3], [3, 3], [5, 6]]
    ret = hpi.sumupGrades(grades, 12, 3)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 18
    expect(ret[2]).toEqual 12

  it "sum up some more weighted grades", ->
    grades = [[3, 6], [1, 6], [3, 6]]
    ret = hpi.sumupGrades(grades, 18, 3)
    expect(ret[0]).toEqual 2
    expect(ret[1]).toEqual 24
    expect(ret[2]).toEqual 18

  it "sum of no grades", ->
    grades = []
    ret = hpi.sumupGrades(grades, 18, 3)
    expect(ret[0]).toBeNaN()
    expect(ret[1]).toEqual 0
    expect(ret[2]).toEqual 0

describe "HPI Planer UI", ->
  it "hides the edit-button when entering edit-mode", ->
    editButton = jQuery('<div/>', {
      id: 'btn-edit-start',
      style: 'position: fixed; left: -100em;',
    }).appendTo('body');
    expect(editButton.is '.hidden').toBe false
    hpi.showEditButtons true
    expect(editButton.is '.hidden').toBe true
    editButton.remove()

  it "shows the edit-button again when leaving edit-mode", ->
    editButton = jQuery('<div/>', {
      id: 'btn-edit-start',
      style: 'position: fixed; left: -100em;',
      class: 'hidden'
    }).appendTo('body');
    expect(editButton.is '.hidden').toBe true
    hpi.showEditButtons false
    expect(editButton.is '.hidden').toBe false
    editButton.remove()

  it "shows the confirm-edit-button when entering edit-mode", ->
    confirmEditButton = jQuery('<div/>', {
      id: 'btn-edit-confirm',
      style: 'position: fixed; left: -100em;',
      class: 'hidden'
    }).appendTo('body');
    expect(confirmEditButton.is '.hidden').toBe true
    hpi.showEditButtons true
    expect(confirmEditButton.is '.hidden').toBe false
    confirmEditButton.remove()

  it "hides the confirm-edit-button again when leaving edit-mode", ->
    confirmEditButton = jQuery('<div/>', {
      id: 'btn-edit-confirm',
      style: 'position: fixed; left: -100em;',
    }).appendTo('body');
    expect(confirmEditButton.is '.hidden').toBe false
    hpi.showEditButtons false
    expect(confirmEditButton.is '.hidden').toBe true
    confirmEditButton.remove()
