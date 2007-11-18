
SVG= \
back.svg                generator_map_mountain.svg  generator_water_lake.svg  monument_arc-de-triomphe.svg  query.svg        speed_play.svg	\
bulldozer.svg           generator_map_plain.svg     government.svg            nature.svg                    raise.svg        tree.svg		\
commercial.svg          generator_tree_dense.svg    hospital.svg              park.svg                      residential.svg  unknown.svg	\
destroy.svg             generator_tree_normal.svg   industrial.svg            police.svg                    road.svg         vehicle.svg	\
education.svg           generator_tree_sparse.svg   layer_building.svg        power.svg                     save.svg         water.svg		\
fire.svg                generator_water_coast.svg   layer_water.svg           power_line.svg                save_load.svg					\
gaz.svg                 generator_water_dry.svg     lower.svg                 power_plant_coal.svg          save_save.svg					\
generator_map_hill.svg  generator_water_island.svg  monument.svg              power_plant_nuclear.svg       speed_pause.svg					\
zone.svg				park_city.svg
SVG_QUERY=commercial.svg gaz.svg industrial.svg residential.svg water.svg power.svg

SVG_CURSOR=$(SVG:%.svg=cursor/%.svg)
PNG_CURSOR=$(SVG_CURSOR:%.svg=%.png)

SVG_QUERY_ON=$(SVG_QUERY:%.svg=query_on/query_%_on.svg)
SVG_QUERY_OFF=$(SVG_QUERY:%.svg=query_off/query_%_off.svg)
PNG_QUERY_ON=$(SVG_QUERY_ON:%.svg=%.png)
PNG_QUERY_OFF=$(SVG_QUERY_OFF:%.svg=%.png)

SVG_MENU-SUBMENU=$(SVG:%.svg=menu-submenu/%.svg)
SVG_MENU-SUBMENU_OVER=$(SVG:%.svg=menu-submenu_over/%_over.svg)
PNG_MENU-SUBMENU=$(SVG_MENU-SUBMENU:%.svg=%.png)
PNG_MENU-SUBMENU_OVER=$(SVG_MENU-SUBMENU_OVER:%.svg=%.png)

all:
	rm -f renderTask.* renderTask_css mvTask
	mv -f renderTask renderTask.old || true
	touch -r renderTask.old renderTask || true
	rm -f renderTask.old
	make all_
	if [ -s renderTask ]; then make render; fi
	#rm -f renderTask

all_: bar bar_over menu menu-submenu_png menu_activate menu_disable menu_over menu-submenu_over_png splash cursor_png query_png

render: renderTask
	for css in renderTask.*; do \
		batik -h 64 -w 64 -cssAlternate `echo $$css | cut -d '.' -f 2` `cat $$css`; \
	done
	if [ -s mvTask ]; then . mvTask; fi

%.png : %.svg
	@echo $< >> renderTask
	echo $< >> renderTask.`cat renderTask_css`

# Default

bar/%.png : %.svg css/backgroundBox.svg css/bar.css css/_content.css
	@echo Bar.bar > renderTask_css
	@echo -d bar >> renderTask.`cat renderTask_css`
	@make $*.png

bar: $(SVG:%.svg=bar/%.png)

bar_over/%_over.png : %.svg css/backgroundBox.svg css/bar_over.css css/_content.css
	echo BarOver.bar_over > renderTask_css
	echo -d bar_over >> renderTask.`cat renderTask_css`
	echo "mv bar_over/$*.png $@" >> mvTask
	make $*.png

bar_over: $(SVG:%.svg=bar_over/%_over.png)

menu/%.png : %.svg css/backgroundBox.svg css/menu.css css/_content.css
	echo Menu.menu > renderTask_css
	echo -d menu >> renderTask.`cat renderTask_css`
	make $*.png

menu: $(SVG:%.svg=menu/%.png)

menu_activate/%_activate.png : %.svg css/backgroundBox.svg css/menu_activate.css css/_content.css
	echo MenuActivate.menu_activate > renderTask_css
	echo -d menu_activate >> renderTask.`cat renderTask_css`
	echo "mv menu_activate/$*.png $@" >> mvTask
	make $*.png

menu_activate: $(SVG:%.svg=menu_activate/%_activate.png)

menu_disable/%_disable.png : %.svg css/backgroundBox.svg css/menu_disable.css css/_content.css
	echo MenuDisable.menu_disable > renderTask_css
	echo -d menu_disable >> renderTask.`cat renderTask_css`
	echo "mv menu_disable/$*.png $@" >> mvTask
	make $*.png

menu_disable: $(SVG:%.svg=menu_disable/%_disable.png)

menu_over/%_over.png : %.svg css/backgroundBox.svg css/menu_over.css css/_content.css
	echo MenuOver.menu_over > renderTask_css
	echo -d menu_over >> renderTask.`cat renderTask_css`
	echo "mv menu_over/$*.png $@" >> mvTask
	make $*.png

menu_over: $(SVG:%.svg=menu_over/%_over.png)

splash/%.png : %.svg css/backgroundBox.svg css/splash.css css/_content.css
	echo Splash.splash > renderTask_css
	echo -d splash >> renderTask.`cat renderTask_css`
	make $*.png

splash: $(SVG:%.svg=splash/%.png)

# Cursor
cursor/%.svg : %.svg xsl/cursor.xsl
	echo Cursor > renderTask_css
	Xalan $< xsl/cursor.xsl > $@

cursor_svg: $(SVG_CURSOR)
cursor_png: $(PNG_CURSOR) css/backgroundBox.svg css/cursor.css css/_content.css

# Query
query_on/query_%_on.svg : %.svg xsl/query.xsl
	echo QueryOn > renderTask_css
	Xalan $< xsl/query.xsl > $@

query_off/query_%_off.svg : %.svg xsl/query.xsl
	echo QueryOff > renderTask_css
	Xalan $< xsl/query.xsl > $@

query_svg_on: $(SVG_QUERY_ON)
query_svg_off: $(SVG_QUERY_OFF)

query_svg: query_svg_on query_svg_off

query_png_on: $(PNG_QUERY_ON) css/backgroundBox.svg css/query_on.css css/_content.css
query_png_off: $(PNG_QUERY_OFF) css/backgroundBox.svg css/query_off.css css/_content.css

query_png: query_png_on query_png_off

# Submenu
menu-submenu/%.svg : %.svg xsl/submenu.xsl
	echo Menu > renderTask_css
	Xalan $< xsl/submenu.xsl > $@

menu-submenu_over/%_over.svg : %.svg xsl/submenu.xsl
	echo MenuOver > renderTask_css
	Xalan $< xsl/submenu.xsl > $@

menu-submenu_svg: $(SVG_MENU-SUBMENU)
menu-submenu_over_svg: $(SVG_MENU-SUBMENU_OVER)

menu-submenu_png: $(PNG_MENU-SUBMENU) css/backgroundBox.svg css/menu.css css/_content.css
menu-submenu_over_png: $(PNG_MENU-SUBMENU_OVER) css/backgroundBox.svg css/menu_over.css css/_content.css
