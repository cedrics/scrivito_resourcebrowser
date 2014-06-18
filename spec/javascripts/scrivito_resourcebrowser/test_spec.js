describe('Resourcebrowser', function() {
  it('has no filters configured', function() {
    expect(window.Resourcebrowser.filters()).toEqual({});
  });
});
