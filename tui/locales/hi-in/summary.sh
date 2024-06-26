#!/bin/env bash

CONTENT="
आपका काम लगभग पूरा हो चुका है, ओपन वॉयस ओएस (Open Voice OS) स्थापित करने के लिए आपके द्वारा चुने गए विकल्पों का सारांश यहां दिया गया है:
    - विधि:     $METHOD            
    - संस्करण:  $CHANNEL            
    - प्रोफाइल:  $PROFILE           
    - जीयूआई:  $FEATURE_GUI
    - कौशल:   $FEATURE_SKILLS
    - ट्यूनिंग:   $TUNING

ओपन वॉयस ओएस (Open Voice OS) इंस्टॉलेशन प्रक्रिया के दौरान चुने गए विकल्पों पर हमारे सिस्टम (System) को आपकी विशिष्ट आवश्यकताओं और प्राथमिकताओं के अनुरूप बनाने के लिए सावधानीपूर्वक विचार किया गया है।
क्या आपको यह सही लगता है?
"
TITLE="Open Voice OS Installation - सारांश"

export CONTENT TITLE
