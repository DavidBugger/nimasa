!(function () {
  var t = {
      3387: function (t) {
        t.exports = function (t) {
          if ("function" != typeof t)
            throw TypeError(t + " is not a function!");
          return t;
        };
      },
      8184: function (t, e, n) {
        var r = n(7574)("unscopables"),
          o = Array.prototype;
        null == o[r] && n(3341)(o, r, {}),
          (t.exports = function (t) {
            o[r][t] = !0;
          });
      },
      4228: function (t, e, n) {
        var r = n(3305);
        t.exports = function (t) {
          if (!r(t)) throw TypeError(t + " is not an object!");
          return t;
        };
      },
      1464: function (t, e, n) {
        var r = n(7221),
          o = n(1485),
          i = n(157);
        t.exports = function (t) {
          return function (e, n, s) {
            var a,
              c = r(e),
              l = o(c.length),
              u = i(s, l);
            if (t && n != n) {
              for (; l > u; ) if ((a = c[u++]) != a) return !0;
            } else
              for (; l > u; u++)
                if ((t || u in c) && c[u] === n) return t || u || 0;
            return !t && -1;
          };
        };
      },
      5089: function (t) {
        var e = {}.toString;
        t.exports = function (t) {
          return e.call(t).slice(8, -1);
        };
      },
      6094: function (t) {
        var e = (t.exports = { version: "2.6.12" });
        "number" == typeof __e && (__e = e);
      },
      5052: function (t, e, n) {
        var r = n(3387);
        t.exports = function (t, e, n) {
          if ((r(t), void 0 === e)) return t;
          switch (n) {
            case 1:
              return function (n) {
                return t.call(e, n);
              };
            case 2:
              return function (n, r) {
                return t.call(e, n, r);
              };
            case 3:
              return function (n, r, o) {
                return t.call(e, n, r, o);
              };
          }
          return function () {
            return t.apply(e, arguments);
          };
        };
      },
      3344: function (t) {
        t.exports = function (t) {
          if (null == t) throw TypeError("Can't call method on  " + t);
          return t;
        };
      },
      1763: function (t, e, n) {
        t.exports = !n(9448)(function () {
          return (
            7 !=
            Object.defineProperty({}, "a", {
              get: function () {
                return 7;
              },
            }).a
          );
        });
      },
      6034: function (t, e, n) {
        var r = n(3305),
          o = n(7526).document,
          i = r(o) && r(o.createElement);
        t.exports = function (t) {
          return i ? o.createElement(t) : {};
        };
      },
      6140: function (t) {
        t.exports =
          "constructor,hasOwnProperty,isPrototypeOf,propertyIsEnumerable,toLocaleString,toString,valueOf".split(
            ","
          );
      },
      2127: function (t, e, n) {
        var r = n(7526),
          o = n(6094),
          i = n(3341),
          s = n(8859),
          a = n(5052),
          c = "prototype",
          l = function (t, e, n) {
            var u,
              p,
              d,
              f,
              h = t & l.F,
              v = t & l.G,
              g = t & l.S,
              b = t & l.P,
              y = t & l.B,
              m = v ? r : g ? r[e] || (r[e] = {}) : (r[e] || {})[c],
              x = v ? o : o[e] || (o[e] = {}),
              w = x[c] || (x[c] = {});
            for (u in (v && (n = e), n))
              (d = ((p = !h && m && void 0 !== m[u]) ? m : n)[u]),
                (f =
                  y && p
                    ? a(d, r)
                    : b && "function" == typeof d
                    ? a(Function.call, d)
                    : d),
                m && s(m, u, d, t & l.U),
                x[u] != d && i(x, u, f),
                b && w[u] != d && (w[u] = d);
          };
        (r.core = o),
          (l.F = 1),
          (l.G = 2),
          (l.S = 4),
          (l.P = 8),
          (l.B = 16),
          (l.W = 32),
          (l.U = 64),
          (l.R = 128),
          (t.exports = l);
      },
      9448: function (t) {
        t.exports = function (t) {
          try {
            return !!t();
          } catch (t) {
            return !0;
          }
        };
      },
      9461: function (t, e, n) {
        t.exports = n(4556)("native-function-to-string", Function.toString);
      },
      7526: function (t) {
        var e = (t.exports =
          "undefined" != typeof window && window.Math == Math
            ? window
            : "undefined" != typeof self && self.Math == Math
            ? self
            : Function("return this")());
        "number" == typeof __g && (__g = e);
      },
      7917: function (t) {
        var e = {}.hasOwnProperty;
        t.exports = function (t, n) {
          return e.call(t, n);
        };
      },
      3341: function (t, e, n) {
        var r = n(7967),
          o = n(1996);
        t.exports = n(1763)
          ? function (t, e, n) {
              return r.f(t, e, o(1, n));
            }
          : function (t, e, n) {
              return (t[e] = n), t;
            };
      },
      1308: function (t, e, n) {
        var r = n(7526).document;
        t.exports = r && r.documentElement;
      },
      2956: function (t, e, n) {
        t.exports =
          !n(1763) &&
          !n(9448)(function () {
            return (
              7 !=
              Object.defineProperty(n(6034)("div"), "a", {
                get: function () {
                  return 7;
                },
              }).a
            );
          });
      },
      1249: function (t, e, n) {
        var r = n(5089);
        t.exports = Object("z").propertyIsEnumerable(0)
          ? Object
          : function (t) {
              return "String" == r(t) ? t.split("") : Object(t);
            };
      },
      3305: function (t) {
        t.exports = function (t) {
          return "object" == typeof t ? null !== t : "function" == typeof t;
        };
      },
      6032: function (t, e, n) {
        "use strict";
        var r = n(4719),
          o = n(1996),
          i = n(3844),
          s = {};
        n(3341)(s, n(7574)("iterator"), function () {
          return this;
        }),
          (t.exports = function (t, e, n) {
            (t.prototype = r(s, { next: o(1, n) })), i(t, e + " Iterator");
          });
      },
      8175: function (t, e, n) {
        "use strict";
        var r = n(2750),
          o = n(2127),
          i = n(8859),
          s = n(3341),
          a = n(906),
          c = n(6032),
          l = n(3844),
          u = n(627),
          p = n(7574)("iterator"),
          d = !([].keys && "next" in [].keys()),
          f = "keys",
          h = "values",
          v = function () {
            return this;
          };
        t.exports = function (t, e, n, g, b, y, m) {
          c(n, e, g);
          var x,
            w,
            S,
            k = function (t) {
              if (!d && t in j) return j[t];
              switch (t) {
                case f:
                case h:
                  return function () {
                    return new n(this, t);
                  };
              }
              return function () {
                return new n(this, t);
              };
            },
            P = e + " Iterator",
            O = b == h,
            L = !1,
            j = t.prototype,
            T = j[p] || j["@@iterator"] || (b && j[b]),
            C = T || k(b),
            E = b ? (O ? k("entries") : C) : void 0,
            q = ("Array" == e && j.entries) || T;
          if (
            (q &&
              (S = u(q.call(new t()))) !== Object.prototype &&
              S.next &&
              (l(S, P, !0), r || "function" == typeof S[p] || s(S, p, v)),
            O &&
              T &&
              T.name !== h &&
              ((L = !0),
              (C = function () {
                return T.call(this);
              })),
            (r && !m) || (!d && !L && j[p]) || s(j, p, C),
            (a[e] = C),
            (a[P] = v),
            b)
          )
            if (
              ((x = { values: O ? C : k(h), keys: y ? C : k(f), entries: E }),
              m)
            )
              for (w in x) w in j || i(j, w, x[w]);
            else o(o.P + o.F * (d || L), e, x);
          return x;
        };
      },
      4970: function (t) {
        t.exports = function (t, e) {
          return { value: e, done: !!t };
        };
      },
      906: function (t) {
        t.exports = {};
      },
      2750: function (t) {
        t.exports = !1;
      },
      4719: function (t, e, n) {
        var r = n(4228),
          o = n(1626),
          i = n(6140),
          s = n(766)("IE_PROTO"),
          a = function () {},
          c = "prototype",
          l = function () {
            var t,
              e = n(6034)("iframe"),
              r = i.length;
            for (
              e.style.display = "none",
                n(1308).appendChild(e),
                e.src = "javascript:",
                (t = e.contentWindow.document).open(),
                t.write("<script>document.F=Object</script>"),
                t.close(),
                l = t.F;
              r--;

            )
              delete l[c][i[r]];
            return l();
          };
        t.exports =
          Object.create ||
          function (t, e) {
            var n;
            return (
              null !== t
                ? ((a[c] = r(t)), (n = new a()), (a[c] = null), (n[s] = t))
                : (n = l()),
              void 0 === e ? n : o(n, e)
            );
          };
      },
      7967: function (t, e, n) {
        var r = n(4228),
          o = n(2956),
          i = n(3048),
          s = Object.defineProperty;
        e.f = n(1763)
          ? Object.defineProperty
          : function (t, e, n) {
              if ((r(t), (e = i(e, !0)), r(n), o))
                try {
                  return s(t, e, n);
                } catch (t) {}
              if ("get" in n || "set" in n)
                throw TypeError("Accessors not supported!");
              return "value" in n && (t[e] = n.value), t;
            };
      },
      1626: function (t, e, n) {
        var r = n(7967),
          o = n(4228),
          i = n(1311);
        t.exports = n(1763)
          ? Object.defineProperties
          : function (t, e) {
              o(t);
              for (var n, s = i(e), a = s.length, c = 0; a > c; )
                r.f(t, (n = s[c++]), e[n]);
              return t;
            };
      },
      627: function (t, e, n) {
        var r = n(7917),
          o = n(8270),
          i = n(766)("IE_PROTO"),
          s = Object.prototype;
        t.exports =
          Object.getPrototypeOf ||
          function (t) {
            return (
              (t = o(t)),
              r(t, i)
                ? t[i]
                : "function" == typeof t.constructor &&
                  t instanceof t.constructor
                ? t.constructor.prototype
                : t instanceof Object
                ? s
                : null
            );
          };
      },
      4561: function (t, e, n) {
        var r = n(7917),
          o = n(7221),
          i = n(1464)(!1),
          s = n(766)("IE_PROTO");
        t.exports = function (t, e) {
          var n,
            a = o(t),
            c = 0,
            l = [];
          for (n in a) n != s && r(a, n) && l.push(n);
          for (; e.length > c; ) r(a, (n = e[c++])) && (~i(l, n) || l.push(n));
          return l;
        };
      },
      1311: function (t, e, n) {
        var r = n(4561),
          o = n(6140);
        t.exports =
          Object.keys ||
          function (t) {
            return r(t, o);
          };
      },
      1996: function (t) {
        t.exports = function (t, e) {
          return {
            enumerable: !(1 & t),
            configurable: !(2 & t),
            writable: !(4 & t),
            value: e,
          };
        };
      },
      8859: function (t, e, n) {
        var r = n(7526),
          o = n(3341),
          i = n(7917),
          s = n(4415)("src"),
          a = n(9461),
          c = "toString",
          l = ("" + a).split(c);
        (n(6094).inspectSource = function (t) {
          return a.call(t);
        }),
          (t.exports = function (t, e, n, a) {
            var c = "function" == typeof n;
            c && (i(n, "name") || o(n, "name", e)),
              t[e] !== n &&
                (c &&
                  (i(n, s) || o(n, s, t[e] ? "" + t[e] : l.join(String(e)))),
                t === r
                  ? (t[e] = n)
                  : a
                  ? t[e]
                    ? (t[e] = n)
                    : o(t, e, n)
                  : (delete t[e], o(t, e, n)));
          })(Function.prototype, c, function () {
            return ("function" == typeof this && this[s]) || a.call(this);
          });
      },
      3844: function (t, e, n) {
        var r = n(7967).f,
          o = n(7917),
          i = n(7574)("toStringTag");
        t.exports = function (t, e, n) {
          t &&
            !o((t = n ? t : t.prototype), i) &&
            r(t, i, { configurable: !0, value: e });
        };
      },
      766: function (t, e, n) {
        var r = n(4556)("keys"),
          o = n(4415);
        t.exports = function (t) {
          return r[t] || (r[t] = o(t));
        };
      },
      4556: function (t, e, n) {
        var r = n(6094),
          o = n(7526),
          i = "__core-js_shared__",
          s = o[i] || (o[i] = {});
        (t.exports = function (t, e) {
          return s[t] || (s[t] = void 0 !== e ? e : {});
        })("versions", []).push({
          version: r.version,
          mode: n(2750) ? "pure" : "global",
          copyright: "© 2020 Denis Pushkarev (zloirock.ru)",
        });
      },
      157: function (t, e, n) {
        var r = n(7087),
          o = Math.max,
          i = Math.min;
        t.exports = function (t, e) {
          return (t = r(t)) < 0 ? o(t + e, 0) : i(t, e);
        };
      },
      7087: function (t) {
        var e = Math.ceil,
          n = Math.floor;
        t.exports = function (t) {
          return isNaN((t = +t)) ? 0 : (t > 0 ? n : e)(t);
        };
      },
      7221: function (t, e, n) {
        var r = n(1249),
          o = n(3344);
        t.exports = function (t) {
          return r(o(t));
        };
      },
      1485: function (t, e, n) {
        var r = n(7087),
          o = Math.min;
        t.exports = function (t) {
          return t > 0 ? o(r(t), 9007199254740991) : 0;
        };
      },
      8270: function (t, e, n) {
        var r = n(3344);
        t.exports = function (t) {
          return Object(r(t));
        };
      },
      3048: function (t, e, n) {
        var r = n(3305);
        t.exports = function (t, e) {
          if (!r(t)) return t;
          var n, o;
          if (e && "function" == typeof (n = t.toString) && !r((o = n.call(t))))
            return o;
          if ("function" == typeof (n = t.valueOf) && !r((o = n.call(t))))
            return o;
          if (
            !e &&
            "function" == typeof (n = t.toString) &&
            !r((o = n.call(t)))
          )
            return o;
          throw TypeError("Can't convert object to primitive value");
        };
      },
      4415: function (t) {
        var e = 0,
          n = Math.random();
        t.exports = function (t) {
          return "Symbol(".concat(
            void 0 === t ? "" : t,
            ")_",
            (++e + n).toString(36)
          );
        };
      },
      7574: function (t, e, n) {
        var r = n(4556)("wks"),
          o = n(4415),
          i = n(7526).Symbol,
          s = "function" == typeof i;
        (t.exports = function (t) {
          return r[t] || (r[t] = (s && i[t]) || (s ? i : o)("Symbol." + t));
        }).store = r;
      },
      5165: function (t, e, n) {
        "use strict";
        var r = n(8184),
          o = n(4970),
          i = n(906),
          s = n(7221);
        (t.exports = n(8175)(
          Array,
          "Array",
          function (t, e) {
            (this._t = s(t)), (this._i = 0), (this._k = e);
          },
          function () {
            var t = this._t,
              e = this._k,
              n = this._i++;
            return !t || n >= t.length
              ? ((this._t = void 0), o(1))
              : o(0, "keys" == e ? n : "values" == e ? t[n] : [n, t[n]]);
          },
          "values"
        )),
          (i.Arguments = i.Array),
          r("keys"),
          r("values"),
          r("entries");
      },
      5890: function (t, e, n) {
        for (
          var r = n(5165),
            o = n(1311),
            i = n(8859),
            s = n(7526),
            a = n(3341),
            c = n(906),
            l = n(7574),
            u = l("iterator"),
            p = l("toStringTag"),
            d = c.Array,
            f = {
              CSSRuleList: !0,
              CSSStyleDeclaration: !1,
              CSSValueList: !1,
              ClientRectList: !1,
              DOMRectList: !1,
              DOMStringList: !1,
              DOMTokenList: !0,
              DataTransferItemList: !1,
              FileList: !1,
              HTMLAllCollection: !1,
              HTMLCollection: !1,
              HTMLFormElement: !1,
              HTMLSelectElement: !1,
              MediaList: !0,
              MimeTypeArray: !1,
              NamedNodeMap: !1,
              NodeList: !0,
              PaintRequestList: !1,
              Plugin: !1,
              PluginArray: !1,
              SVGLengthList: !1,
              SVGNumberList: !1,
              SVGPathSegList: !1,
              SVGPointList: !1,
              SVGStringList: !1,
              SVGTransformList: !1,
              SourceBufferList: !1,
              StyleSheetList: !0,
              TextTrackCueList: !1,
              TextTrackList: !1,
              TouchList: !1,
            },
            h = o(f),
            v = 0;
          v < h.length;
          v++
        ) {
          var g,
            b = h[v],
            y = f[b],
            m = s[b],
            x = m && m.prototype;
          if (x && (x[u] || a(x, u, d), x[p] || a(x, p, b), (c[b] = d), y))
            for (g in r) x[g] || i(x, g, r[g], !0);
        }
      },
      7999: function (t, e, n) {
        !(function (t) {
          "use strict";
          var e,
            r = /^[a-z]+:/,
            o = /[-a-z0-9]+(\.[-a-z0-9])*:\d+/i,
            i = /\/\/(.*?)(?::(.*?))?@/,
            s = /^win/i,
            a = /:$/,
            c = /^\?/,
            l = /^#/,
            u = /(.*\/)/,
            p = /^\/{2,}/,
            d = /(^\/?)/,
            f = /'/g,
            h = /%([ef][0-9a-f])%([89ab][0-9a-f])%([89ab][0-9a-f])/gi,
            v = /%([cd][0-9a-f])%([89ab][0-9a-f])/gi,
            g = /%([0-7][0-9a-f])/gi,
            b = /\+/g,
            y = /^\w:$/,
            m = /[^/#?]/,
            x = "undefined" == typeof window && void 0 !== n.g && !0,
            w =
              !x &&
              t.navigator &&
              t.navigator.userAgent &&
              ~t.navigator.userAgent.indexOf("MSIE"),
            S = x ? t.require : null,
            k = {
              protocol: "protocol",
              host: "hostname",
              port: "port",
              path: "pathname",
              query: "search",
              hash: "hash",
            },
            P = { ftp: 21, gopher: 70, http: 80, https: 443, ws: 80, wss: 443 };
          function O() {
            return x
              ? (e =
                  e ||
                  "file://" +
                    (process.platform.match(s) ? "/" : "") +
                    S("fs").realpathSync("."))
              : "about:srcdoc" === document.location.href
              ? self.parent.document.location.href
              : document.location.href;
          }
          function L(t) {
            return encodeURIComponent(t).replace(f, "%27");
          }
          function j(t) {
            return (t = (t = (t = t.replace(b, " ")).replace(
              h,
              function (t, e, n, r) {
                var o = parseInt(e, 16) - 224,
                  i = parseInt(n, 16) - 128;
                if (0 == o && i < 32) return t;
                var s = (o << 12) + (i << 6) + (parseInt(r, 16) - 128);
                return 65535 < s ? t : String.fromCharCode(s);
              }
            )).replace(v, function (t, e, n) {
              var r = parseInt(e, 16) - 192;
              if (r < 2) return t;
              var o = parseInt(n, 16) - 128;
              return String.fromCharCode((r << 6) + o);
            })).replace(g, function (t, e) {
              return String.fromCharCode(parseInt(e, 16));
            });
          }
          function T(t) {
            for (var e = t.split("&"), n = 0, r = e.length; n < r; n++) {
              var o = e[n].split("="),
                i = decodeURIComponent(o[0].replace(b, " "));
              if (i) {
                var s = void 0 !== o[1] ? j(o[1]) : null;
                void 0 === this[i]
                  ? (this[i] = s)
                  : (this[i] instanceof Array || (this[i] = [this[i]]),
                    this[i].push(s));
              }
            }
          }
          function C(t, e) {
            !(function (t, e, n) {
              var s, f, h;
              (e = e || O()),
                x
                  ? (s = S("url").parse(e))
                  : ((s = document.createElement("a")).href = e);
              var v,
                g,
                b =
                  ((g = { path: !0, query: !0, hash: !0 }),
                  (v = e) &&
                    r.test(v) &&
                    ((g.protocol = !0),
                    (g.host = !0),
                    o.test(v) && (g.port = !0),
                    i.test(v) && ((g.user = !0), (g.pass = !0))),
                  g);
              for (f in ((h = e.match(i) || []), k))
                b[f] ? (t[f] = s[k[f]] || "") : (t[f] = "");
              if (
                ((t.protocol = t.protocol.replace(a, "")),
                (t.query = t.query.replace(c, "")),
                (t.hash = j(t.hash.replace(l, ""))),
                (t.user = j(h[1] || "")),
                (t.pass = j(h[2] || "")),
                (t.port = P[t.protocol] == t.port || 0 == t.port ? "" : t.port),
                !b.protocol &&
                  m.test(e.charAt(0)) &&
                  (t.path = e.split("?")[0].split("#")[0]),
                !b.protocol && n)
              ) {
                var y = new C(O().match(u)[0]),
                  L = y.path.split("/"),
                  E = t.path.split("/"),
                  q = ["protocol", "user", "pass", "host", "port"],
                  M = q.length;
                for (L.pop(), f = 0; f < M; f++) t[q[f]] = y[q[f]];
                for (; ".." === E[0]; ) L.pop(), E.shift();
                t.path =
                  ("/" !== e.charAt(0) ? L.join("/") : "") + "/" + E.join("/");
              }
              (t.path = t.path.replace(p, "/")),
                w && (t.path = t.path.replace(d, "/")),
                t.paths(t.paths()),
                (t.query = new T(t.query));
            })(this, t, !e);
          }
          (T.prototype.toString = function () {
            var t,
              e,
              n = "",
              r = L;
            for (t in this) {
              var o = this[t];
              if (!(o instanceof Function || void 0 === o))
                if (o instanceof Array) {
                  var i = o.length;
                  if (!i) {
                    n += (n ? "&" : "") + r(t) + "=";
                    continue;
                  }
                  for (e = 0; e < i; e++) {
                    var s = o[e];
                    void 0 !== s &&
                      ((n += n ? "&" : ""),
                      (n += r(t) + (null === s ? "" : "=" + r(s))));
                  }
                } else
                  (n += n ? "&" : ""),
                    (n += r(t) + (null === o ? "" : "=" + r(o)));
            }
            return n;
          }),
            (C.prototype.clearQuery = function () {
              for (var t in this.query)
                this.query[t] instanceof Function || delete this.query[t];
              return this;
            }),
            (C.prototype.queryLength = function () {
              var t = 0;
              for (var e in this.query)
                this.query[e] instanceof Function || t++;
              return t;
            }),
            (C.prototype.isEmptyQuery = function () {
              return 0 === this.queryLength();
            }),
            (C.prototype.paths = function (t) {
              var e,
                n = "",
                r = 0;
              if (t && t.length && t + "" !== t) {
                for (this.isAbsolute() && (n = "/"), e = t.length; r < e; r++)
                  t[r] = !r && y.test(t[r]) ? t[r] : L(t[r]);
                this.path = n + t.join("/");
              }
              for (
                r = 0,
                  e = (t = (
                    "/" === this.path.charAt(0) ? this.path.slice(1) : this.path
                  ).split("/")).length;
                r < e;
                r++
              )
                t[r] = j(t[r]);
              return t;
            }),
            (C.prototype.encode = L),
            (C.prototype.decode = j),
            (C.prototype.isAbsolute = function () {
              return this.protocol || "/" === this.path.charAt(0);
            }),
            (C.prototype.toString = function () {
              return (
                (this.protocol && this.protocol + "://") +
                (this.user &&
                  L(this.user) + (this.pass && ":" + L(this.pass)) + "@") +
                (this.host && this.host) +
                (this.port && ":" + this.port) +
                (this.path && this.path) +
                (this.query.toString() && "?" + this.query) +
                (this.hash && "#" + L(this.hash))
              );
            }),
            (t[t.exports ? "exports" : "Url"] = C);
        })((t = n.nmd(t)).exports ? t : window);
      },
    },
    e = {};
  function n(r) {
    var o = e[r];
    if (void 0 !== o) return o.exports;
    var i = (e[r] = { id: r, loaded: !1, exports: {} });
    return t[r](i, i.exports, n), (i.loaded = !0), i.exports;
  }
  (n.n = function (t) {
    var e =
      t && t.__esModule
        ? function () {
            return t.default;
          }
        : function () {
            return t;
          };
    return n.d(e, { a: e }), e;
  }),
    (n.d = function (t, e) {
      for (var r in e)
        n.o(e, r) &&
          !n.o(t, r) &&
          Object.defineProperty(t, r, { enumerable: !0, get: e[r] });
    }),
    (n.g = (function () {
      if ("object" == typeof globalThis) return globalThis;
      try {
        return this || new Function("return this")();
      } catch (t) {
        if ("object" == typeof window) return window;
      }
    })()),
    (n.o = function (t, e) {
      return Object.prototype.hasOwnProperty.call(t, e);
    }),
    (n.nmd = function (t) {
      return (t.paths = []), t.children || (t.children = []), t;
    }),
    (function () {
      "use strict";
      n(5165), n(5890);
      var t = n(7999),
        e = n.n(t);
      const r = () => {
        const t = getComputedStyle(document.documentElement);
        return {
          primary: t.getPropertyValue("--bs-primary"),
          primarySubtle: t.getPropertyValue("--bs-primary-subtle"),
          secondary: t.getPropertyValue("--bs-secondary"),
          success: t.getPropertyValue("--bs-success"),
          warning: t.getPropertyValue("--bs-warning"),
          danger: t.getPropertyValue("--bs-danger"),
          info: t.getPropertyValue("--bs-info"),
          bodyBg: t.getPropertyValue("--bs-body-bg"),
          bodyColor: t.getPropertyValue("--bs-body-color"),
          secondaryBg: t.getPropertyValue("--bs-secondary-bg"),
          secondaryColor: t.getPropertyValue("--bs-secondary-color"),
          tertiaryBg: t.getPropertyValue("--bs-tertiary-bg"),
          tertiaryColor: t.getPropertyValue("--bs-tertiary-color"),
          quaternaryBg: t.getPropertyValue("--bs-quaternary-bg"),
          quaternaryColor: t.getPropertyValue("--bs-quaternary-color"),
        };
      };
      window.cssVariables = r();
      let o = !1;
      const i = new (e())(),
        s = "appstack-config-",
        a = ".js-settings",
        c = {
          theme: "default",
          layout: "fluid",
          sidebarPosition: "left",
          sidebarBehavior: "sticky",
        },
        l = {
          theme: {
            default: { bsTheme: "light", sidebarTheme: "dark" },
            colored: { bsTheme: "light", sidebarTheme: "colored" },
            light: { bsTheme: "light", sidebarTheme: "light" },
            dark: { bsTheme: "dark", sidebarTheme: "dark" },
          },
          layout: { fluid: { layout: "fluid" }, boxed: { layout: "boxed" } },
          sidebarPosition: {
            left: { sidebarPosition: "left" },
            right: { sidebarPosition: "right" },
          },
          sidebarBehavior: {
            sticky: { sidebarBehavior: "sticky" },
            fixed: { sidebarBehavior: "fixed" },
            compact: { sidebarBehavior: "compact" },
          },
        },
        u = () => {
          o ||
            (document.body.appendChild(
              ((t) => {
                const e = document.createElement("template");
                return (e.innerHTML = t), e.content.firstChild;
              })(
                '<div class="settings js-settings" style="display:none;">\n  <div class="settings-toggle ">\n    <div class="settings-toggle-option settings-toggle-option-text js-settings-toggle" title="Theme Builder">\n      <svg\n        class="lucide align-middle mb-1"\n        xmlns="http://www.w3.org/2000/svg"\n        width="24"\n        height="24"\n        viewBox="0 0 24 24"\n        fill="none"\n        stroke="currentColor"\n        stroke-width="2"\n        stroke-linecap="round"\n        stroke-linejoin="round"\n      >\n        <line x1="4" x2="4" y1="21" y2="14" />\n        <line x1="4" x2="4" y1="10" y2="3" />\n        <line x1="12" x2="12" y1="21" y2="12" />\n        <line x1="12" x2="12" y1="8" y2="3" />\n        <line x1="20" x2="20" y1="21" y2="16" />\n        <line x1="20" x2="20" y1="12" y2="3" />\n        <line x1="2" x2="6" y1="14" y2="14" />\n        <line x1="10" x2="14" y1="8" y2="8" />\n        <line x1="18" x2="22" y1="16" y2="16" />\n      </svg>\n      Builder\n    </div>\n    <a class="settings-toggle-option" title="Documentation" href="docs-introduction.html" target="_blank">\n      <svg\n        class="lucide align-middle"\n        xmlns="http://www.w3.org/2000/svg"\n        width="24"\n        height="24"\n        viewBox="0 0 24 24"\n        fill="none"\n        stroke="currentColor"\n        stroke-width="2"\n        stroke-linecap="round"\n        stroke-linejoin="round"\n      >\n        <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z" />\n        <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z" />\n      </svg>\n  \n    </a>\n  </div>\n\n  <div class="settings-panel">\n    <div class="settings-content">\n      <div class="settings-title d-flex align-items-center">\n        <button type="button" class="btn-close float-right js-settings-toggle" aria-label="Close"></button>\n\n        <h4 class="mb-0 ms-2 d-inline-block">Theme Builder</h4>\n      </div>\n\n      <div class="settings-body">\n\n        <div class="alert alert-primary" role="alert">\n          <div class="alert-message">\n            <strong>Hey there!</strong> Set your own customized style below. Choose the ones that best fits your needs.\n          </div>\n        </div>\n\n        <div class="mb-3">\n          <span class="d-block font-size-lg font-weight-bold">Color scheme</span>\n          <span class="d-block text-muted mb-2">The perfect color mode for your app.</span>\n\n          <div class="row g-0 text-center mx-n1 mb-2">\n            <div class="col">\n              <label class="mx-1 d-block mb-1">\n                <input class="settings-scheme-label" type="radio" name="theme" value="default">\n                <div class="settings-scheme">\n                  <div class="settings-scheme-theme settings-scheme-theme-default"></div>\n                </div>\n              </label>\n              Default\n            </div>\n            <div class="col">\n              <label class="mx-1 d-block mb-1">\n                <input class="settings-scheme-label" type="radio" name="theme" value="colored">\n                <div class="settings-scheme">\n                  <div class="settings-scheme-theme settings-scheme-theme-colored"></div>\n                </div>\n              </label>\n              Colored\n            </div>\n          </div>\n          <div class="row g-0 text-center mx-n1">\n            <div class="col">\n              <label class="mx-1 d-block mb-1">\n                <input class="settings-scheme-label" type="radio" name="theme" value="dark">\n                <div class="settings-scheme">\n                  <div class="settings-scheme-theme settings-scheme-theme-dark"></div>\n                </div>\n              </label>\n              Dark\n            </div>\n            <div class="col">\n              <label class="mx-1 d-block mb-1">\n                <input class="settings-scheme-label" type="radio" name="theme" value="light">\n                <div class="settings-scheme">\n                  <div class="settings-scheme-theme settings-scheme-theme-light"></div>\n                </div>\n              </label>\n              Light\n            </div>\n          </div>\n        </div>\n        \n        <hr />\n\n        <div class="mb-3">\n          <span class="d-block font-size-lg font-weight-bold">Sidebar position</span>\n          <span class="d-block text-muted mb-2">Toggle the position of the sidebar.</span>\n\n          <div>\n            <label>\n              <input class="settings-button-label" type="radio" name="sidebarPosition" value="left">\n              <div class="settings-button">\n                Left\n              </div>\n            </label>\n            <label>\n              <input class="settings-button-label" type="radio" name="sidebarPosition" value="right">\n              <div class="settings-button">\n                Right\n              </div>\n            </label>\n          </div>\n        </div>\n\n        <hr />\n\n        <div class="mb-3">\n          <span class="d-block font-size-lg font-weight-bold">Sidebar behavior</span>\n          <span class="d-block text-muted mb-2">Change the behavior of the sidebar.</span>\n\n          <div>\n            <label>\n              <input class="settings-button-label" type="radio" name="sidebarBehavior" value="sticky">\n              <div class="settings-button">\n                Sticky\n              </div>\n            </label>\n            <label>\n              <input class="settings-button-label" type="radio" name="sidebarBehavior" value="fixed">\n              <div class="settings-button">\n                Fixed\n              </div>\n            </label>\n            <label>\n              <input class="settings-button-label" type="radio" name="sidebarBehavior" value="compact">\n              <div class="settings-button">\n                Compact\n              </div>\n            </label>\n          </div>\n        </div>\n\n        <hr />\n\n        <div class="mb-3">\n          <span class="d-block font-size-lg font-weight-bold">Layout</span>\n          <span class="d-block text-muted mb-2">Toggle container layout system.</span>\n\n          <div>\n            <label>\n              <input class="settings-button-label" type="radio" name="layout" value="fluid">\n              <div class="settings-button">\n                Fluid\n              </div>\n            </label>\n            <label>\n              <input class="settings-button-label" type="radio" name="layout" value="boxed">\n              <div class="settings-button">\n                Boxed\n              </div>\n            </label>\n          </div>\n        </div>\n\n      </div>\n\n      <div class="settings-footer">\n        <div class="d-grid">\n          <a class="btn btn-primary btn-lg btn-block" href="https://themes.getbootstrap.com/product/appstack-responsive-admin-template/" target="_blank">Purchase</a>\n        </div>\n      </div>\n\n    </div>\n  </div>\n</div>'
              )
            ),
            p(),
            d(),
            f(),
            h(),
            (o = !0));
        },
        p = () => {
          const t = document.querySelector(a);
          document.querySelectorAll(".js-settings-toggle").forEach((e) => {
            e.onclick = (e) => {
              e.preventDefault(), t.classList.toggle("open"), f();
            };
          }),
            (document.body.onclick = (e) => {
              t.contains(e.target) || t.classList.remove("open");
            });
        },
        d = () => {
          document
            .querySelector(a)
            .querySelectorAll("input[type=radio]")
            .forEach((t) => {
              t.addEventListener("change", (t) => {
                g(t.target.name, t.target.value),
                  x(t.target.name, t.target.value),
                  "theme" === t.target.name &&
                    ((window.cssVariables = r()),
                    window.document.dispatchEvent(
                      new Event("DOMContentLoaded", {
                        bubbles: !0,
                        cancelable: !0,
                      })
                    ));
              });
            });
        },
        f = () => {
          for (let [t, e] of Object.entries(b())) {
            const n = e || c[t];
            document.querySelector(
              'input[name="'.concat(t, '"][value="').concat(n, '"]')
            ).checked = !0;
          }
        },
        h = () => {
          setTimeout(() => {
            if (!m("visited")) {
              document.querySelector(a).classList.toggle("open"),
                x("visited", !0);
            }
          }, 1e3);
        },
        v = () => {
          for (let [t, e] of Object.entries(b())) {
            g(t, e || c[t]);
          }
        },
        g = (t, e) => {
          for (let [n, r] of Object.entries(l[t][e]))
            document.documentElement.dataset[n] = r;
        },
        b = () => ({
          theme: m("theme"),
          layout: m("layout"),
          sidebarPosition: m("sidebarPosition"),
          sidebarBehavior: m("sidebarBehavior"),
        }),
        y = () => {
          w("theme"), w("layout"), w("sidebarPosition"), w("sidebarBehavior");
        },
        m = (t) => localStorage.getItem("".concat(s).concat(t)),
        x = (t, e) => {
          localStorage.setItem("".concat(s).concat(t), e);
        },
        w = (t) => {
          localStorage.removeItem("".concat(s).concat(t));
        };
      document.addEventListener("DOMContentLoaded", () => u());
      const S = new MutationObserver(function () {
        document.documentElement &&
          (Object.keys(i.query).length > 0
            ? (y(),
              Object.entries(i.query).forEach((t) => {
                let [e, n] = t;
                l[e] && l[e][n] && (g(e, n), x(e, n));
              }))
            : v(),
          S.disconnect());
      });
      S.observe(document.documentElement, { childList: !0 });
    })();
})();
