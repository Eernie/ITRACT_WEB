(function() {

  describe("A suite", function() {
    return it("contains spec with an expectation", function() {
      return expect(true).toBe(true);
    });
  });

  describe("A suite is just a function", function() {
    var a;
    a = void 0;
    return it("and so is a spec", function() {
      a = true;
      return expect(a).toBe(true);
    });
  });

  describe("The 'toBe' matcher compares with ===", function() {
    it("and has a positive case ", function() {
      return expect(true).toBe(true);
    });
    return it("and can have a negative case", function() {
      return expect(false).not.toBe(true);
    });
  });

  describe("Included matchers:", function() {
    it("The 'toBe' matcher compares with ===", function() {
      var a, b;
      a = 12;
      b = a;
      expect(a).toBe(b);
      return expect(a).not.toBe(null);
    });
    describe("The 'toEqual' matcher", function() {
      it("works for simple literals and variables", function() {
        var a;
        a = 12;
        return expect(a).toEqual(12);
      });
      return it("should work for objects", function() {
        var bar, foo;
        foo = {
          a: 12,
          b: 34
        };
        bar = {
          a: 12,
          b: 34
        };
        return expect(foo).toEqual(bar);
      });
    });
    it("The 'toMatch' matcher is for regular expressions", function() {
      var message;
      message = "foo bar baz";
      expect(message).toMatch(/bar/);
      expect(message).toMatch("bar");
      return expect(message).not.toMatch(/quux/);
    });
    it("The 'toBeDefined' matcher compares against `undefined`", function() {
      var a;
      a = {
        foo: "foo"
      };
      expect(a.foo).toBeDefined();
      return expect(a.bar).not.toBeDefined();
    });
    it("The `toBeUndefined` matcher compares against `undefined`", function() {
      var a;
      a = {
        foo: "foo"
      };
      expect(a.foo).not.toBeUndefined();
      return expect(a.foo).not.toBeUndefined();
    });
    it("The 'toBeNull' matcher compares against null", function() {
      var a, foo;
      a = null;
      foo = "foo";
      expect(null).toBeNull();
      expect(a).toBeNull();
      return expect(foo).not.toBeNull();
    });
    it("The 'toBeTruthy' matcher is for boolean casting testing", function() {
      var a, foo;
      a = void 0;
      foo = "foo";
      expect(foo).toBeTruthy();
      return expect(a).not.toBeTruthy();
    });
    it("The 'toBeFalsy' matcher is for boolean casting testing", function() {
      var a, foo;
      a = void 0;
      foo = "foo";
      expect(a).toBeFalsy();
      return expect(foo).not.toBeFalsy();
    });
    it("The 'toContain' matcher is for finding an item in an Array", function() {
      var a;
      a = ["foo", "bar", "baz"];
      expect(a).toContain("bar");
      return expect(a).not.toContain("quux");
    });
    it("The 'toBeLessThan' matcher is for mathematical comparisons", function() {
      var e, pi;
      pi = 3.1415926;
      e = 2.78;
      expect(e).toBeLessThan(pi);
      return expect(pi).not.toBeLessThan(e);
    });
    it("The 'toBeGreaterThan' is for mathematical comparisons", function() {
      var e, pi;
      pi = 3.1415926;
      e = 2.78;
      expect(pi).toBeGreaterThan(e);
      return expect(e).not.toBeGreaterThan(pi);
    });
    it("The 'toBeCloseTo' matcher is for precision math comparison", function() {
      var e, pi;
      pi = 3.1415926;
      e = 2.78;
      expect(pi).not.toBeCloseTo(e, 0.1);
      return expect(pi).toBeCloseTo(e, 0);
    });
    return it("The 'toThrow' matcher is for testing if a function throws an exception", function() {
      var bar, foo;
      foo = function() {
        return 1 + 2;
      };
      bar = function() {
        return a + 1;
      };
      expect(foo).not.toThrow();
      return expect(bar).toThrow();
    });
  });

  describe("A spec", function() {
    it("is just a function, so it can contain any code", function() {
      var foo;
      foo = 0;
      foo += 1;
      return expect(foo).toEqual(1);
    });
    return it("can have more than one expectation", function() {
      var foo;
      foo = 0;
      foo += 1;
      expect(foo).toEqual(1);
      return expect(true).toEqual(true);
    });
  });

  describe("A spec (with setup and tear-down)", function() {
    var foo;
    foo = void 0;
    beforeEach(function() {
      foo = 0;
      return foo += 1;
    });
    afterEach(function() {
      return foo = 0;
    });
    it("is just a function, so it can contain any code", function() {
      return expect(foo).toEqual(1);
    });
    return it("can have more than one expectation", function() {
      expect(foo).toEqual(1);
      return expect(true).toEqual(true);
    });
  });

  describe("A spec", function() {
    var foo;
    foo = void 0;
    beforeEach(function() {
      foo = 0;
      return foo += 1;
    });
    afterEach(function() {
      return foo = 0;
    });
    it("is just a function, so it can contain any code", function() {
      return expect(foo).toEqual(1);
    });
    it("can have more than one expectation", function() {
      expect(foo).toEqual(1);
      return expect(true).toEqual(true);
    });
    return describe("nested inside a second describe", function() {
      var bar;
      bar = void 0;
      beforeEach(function() {
        return bar = 1;
      });
      return it("can reference both scopes as needed ", function() {
        return expect(foo).toEqual(bar);
      });
    });
  });

  xdescribe("A spec", function() {
    var foo;
    foo = void 0;
    beforeEach(function() {
      foo = 0;
      return foo += 1;
    });
    return xit("is just a function, so it can contain any code", function() {
      return expect(foo).toEqual(1);
    });
  });

  describe("A spy", function() {
    var bar, foo;
    foo = void 0;
    bar = null;
    beforeEach(function() {
      foo = {
        setBar: function(value) {
          return bar = value;
        }
      };
      spyOn(foo, "setBar");
      foo.setBar(123);
      return foo.setBar(456, "another param");
    });
    it("tracks that the spy was called", function() {
      return expect(foo.setBar).toHaveBeenCalled();
    });
    it("tracks its number of calls", function() {
      return expect(foo.setBar.calls.length).toEqual(2);
    });
    it("tracks all the arguments of its calls", function() {
      expect(foo.setBar).toHaveBeenCalledWith(123);
      return expect(foo.setBar).toHaveBeenCalledWith(456, "another param");
    });
    it("allows access to the most recent call", function() {
      return expect(foo.setBar.mostRecentCall.args[0]).toEqual(456);
    });
    it("allows access to other calls", function() {
      return expect(foo.setBar.calls[0].args[0]).toEqual(123);
    });
    return it("stops all execution on a function", function() {
      return expect(bar).toBeNull();
    });
  });

  describe("A spy, when configured to call through", function() {
    var bar, fetchedBar, foo;
    foo = void 0;
    bar = void 0;
    fetchedBar = void 0;
    beforeEach(function() {
      foo = {
        setBar: function(value) {
          return bar = value;
        },
        getBar: function() {
          return bar;
        }
      };
      spyOn(foo, "getBar").andCallThrough();
      foo.setBar(123);
      return fetchedBar = foo.getBar();
    });
    it("tracks that the spy was called", function() {
      return expect(foo.getBar).toHaveBeenCalled();
    });
    it("should not effect other functions", function() {
      return expect(bar).toEqual(123);
    });
    return it("when called returns the requested value", function() {
      return expect(fetchedBar).toEqual(123);
    });
  });

  describe("A spy, when faking a return value", function() {
    var bar, fetchedBar, foo;
    foo = void 0;
    bar = void 0;
    fetchedBar = void 0;
    beforeEach(function() {
      foo = {
        setBar: function(value) {
          return bar = value;
        },
        getBar: function() {
          return bar;
        }
      };
      spyOn(foo, "getBar").andReturn(745);
      foo.setBar(123);
      return fetchedBar = foo.getBar();
    });
    it("tracks that the spy was called", function() {
      return expect(foo.getBar).toHaveBeenCalled();
    });
    it("should not effect other functions", function() {
      return expect(bar).toEqual(123);
    });
    return it("when called returns the requested value", function() {
      return expect(fetchedBar).toEqual(745);
    });
  });

  describe("A spy, when faking a return value", function() {
    var bar, fetchedBar, foo;
    foo = void 0;
    bar = void 0;
    fetchedBar = void 0;
    beforeEach(function() {
      foo = {
        setBar: function(value) {
          return bar = value;
        },
        getBar: function() {
          return bar;
        }
      };
      spyOn(foo, "getBar").andCallFake(function() {
        return 1001;
      });
      foo.setBar(123);
      return fetchedBar = foo.getBar();
    });
    it("tracks that the spy was called", function() {
      return expect(foo.getBar).toHaveBeenCalled();
    });
    it("should not effect other functions", function() {
      return expect(bar).toEqual(123);
    });
    return it("when called returns the requested value", function() {
      return expect(fetchedBar).toEqual(1001);
    });
  });

  describe("A spy, when created manually", function() {
    var whatAmI;
    whatAmI = void 0;
    beforeEach(function() {
      whatAmI = jasmine.createSpy("whatAmI");
      return whatAmI("I", "am", "a", "spy");
    });
    it("is named, which helps in error reporting", function() {
      return expect(whatAmI.identity).toEqual("whatAmI");
    });
    it("tracks that the spy was called", function() {
      return expect(whatAmI).toHaveBeenCalled();
    });
    it("tracks its number of calls", function() {
      return expect(whatAmI.calls.length).toEqual(1);
    });
    it("tracks all the arguments of its calls", function() {
      return expect(whatAmI).toHaveBeenCalledWith("I", "am", "a", "spy");
    });
    return it("allows access to the most recent call", function() {
      return expect(whatAmI.mostRecentCall.args[0]).toEqual("I");
    });
  });

  describe("Multiple spies, when created manually", function() {
    var tape;
    tape = void 0;
    beforeEach(function() {
      tape = jasmine.createSpyObj("tape", ["play", "pause", "stop", "rewind"]);
      tape.play();
      tape.pause();
      return tape.rewind(0);
    });
    it("creates spies for each requested function", function() {
      expect(tape.play).toBeDefined();
      expect(tape.pause).toBeDefined();
      expect(tape.stop).toBeDefined();
      return expect(tape.rewind).toBeDefined();
    });
    it("tracks that the spies were called", function() {
      expect(tape.play).toHaveBeenCalled();
      expect(tape.pause).toHaveBeenCalled();
      expect(tape.rewind).toHaveBeenCalled();
      return expect(tape.stop).not.toHaveBeenCalled();
    });
    return it("tracks all the arguments of its calls", function() {
      return expect(tape.rewind).toHaveBeenCalledWith(0);
    });
  });

  describe("jasmine.any", function() {
    it("matches any value", function() {
      expect({}).toEqual(jasmine.any(Object));
      return expect(12).toEqual(jasmine.any(Number));
    });
    return describe("when used with a spy", function() {
      return it("is useful for comparing arguments", function() {
        var foo;
        foo = jasmine.createSpy("foo");
        foo(12, function() {
          return true;
        });
        return expect(foo).toHaveBeenCalledWith(jasmine.any(Number), jasmine.any(Function));
      });
    });
  });

  describe("Manually ticking the Jasmine Mock Clock", function() {
    var timerCallback;
    timerCallback = void 0;
    beforeEach(function() {
      timerCallback = jasmine.createSpy("timerCallback");
      return jasmine.Clock.useMock();
    });
    it("causes a timeout to be called synchronously", function() {
      setTimeout((function() {
        return timerCallback();
      }), 100);
      expect(timerCallback).not.toHaveBeenCalled();
      jasmine.Clock.tick(101);
      return expect(timerCallback).toHaveBeenCalled();
    });
    return it("causes an interval to be called synchronously", function() {
      setInterval((function() {
        return timerCallback();
      }), 100);
      expect(timerCallback).not.toHaveBeenCalled();
      jasmine.Clock.tick(101);
      expect(timerCallback.callCount).toEqual(1);
      jasmine.Clock.tick(50);
      expect(timerCallback.callCount).toEqual(1);
      jasmine.Clock.tick(50);
      return expect(timerCallback.callCount).toEqual(2);
    });
  });

  describe("Asynchronous specs", function() {
    var flag, value;
    value = void 0;
    flag = void 0;
    return it("should support async execution of test preparation and exepectations", function() {
      runs(function() {
        flag = false;
        value = 0;
        return setTimeout((function() {
          return flag = true;
        }), 500);
      });
      waitsFor((function() {
        value++;
        return flag;
      }), "The Value should be incremented", 750);
      return runs(function() {
        return expect(value).toBeGreaterThan(0);
      });
    });
  });

}).call(this);
