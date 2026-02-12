{% set current_lang = page.lang || theme.default_lang || 'zh-CN' %}
{% set localized_resume = site.data.resume and site.data.resume[current_lang] %}
{% set resume = localized_resume || theme.resume %}

<div id="resume">
    <header id="header" class="clear">
        <div class="lang-switcher">
            <a href="{{ config.root }}" class="{% if current_lang == 'zh-CN' %}active{% endif %}">简</a>
            <a href="{{ config.root }}zh-tw/" class="{% if current_lang == 'zh-TW' %}active{% endif %}">繁</a>
            <a href="{{ config.root }}en/" class="{% if current_lang == 'en' %}active{% endif %}">EN</a>
        </div>
        <div>
            <h1 class="name">{{ resume.name }}</h1>
            <h2 class="label">{{ resume.jobtitle }}</h2>
        </div>

        <span class="location">
            {% for item in resume.location %}
            <span class="{{ item.key }}">{{ item.value }},</span>
            {% endfor %}
        </span>


        <div id="contact">
            {% for item in resume.contact %}
            <div>
                <span class=" fa {{item.icon}}"></span>
                <a target="_blank" href="{{item.text}}">{{item.text}}</a>
            </div>
            {% endfor %}
        </div>

        <div id="profiles">
            {% for item in resume.profiles %}
            <div class="item">
                <div class="username">
                    <span class="fa {{item.icon}} social"></span>
                    <span class="url">
                        <a target="_blank" href="{{item.link}}">{{item.text}}</a>
                    </span>
                </div>
            </div>
            {% endfor %}
        </div>
    </header>

    <section class="section main-summary">
        <section>
            <div>
                <p>{{resume.overview}}</p>
            </div>
        </section>
    </section>

    <section class="section margin1">
        <header>
            <h2 class="section-title">{{ __('resume.skills') }}</h2>
        </header>
        <section id="skills">
            {% for item in resume.skills %}
            <div class="item">
                <h3 class="name">
                    {{item.title}}
                </h3>

                <div class="level {{item.level}}">
                    <em>{{item.level.toUpperCase()}}</em>
                    <div class="bar"></div>
                </div>
                <ul class="keywords">
                    {% for skill in item.items %}
                    <li>{{skill}}</li>
                    {% endfor %}
                </ul>
            </div>
            {% endfor %}
        </section>
    </section>

    <section class="section">
        <header>
            <h2 class="section-title">{{ __('resume.work_experience') }} <span
                    class="item-count">({{resume.experience.length}})</span></h2>
        </header>

        {% for item in resume.experience %}
        <section class="work-item">

            <input id="work-item-{{ loop.index }}" type="checkbox" class="toggle-item" checked="checked">
            <label for="work-item-{{ loop.index }}"></label>

            <header>
                <div class="position">{{item.position}}</div>
                <div class="company">{{item.company}}</div>
                <div class="date">{{item.duration}}</div>
            </header>

            <span class="website">
                <a target="_blank" href="{{item.website}}">{{item.website}}</a>
            </span>
            <div class="item" id="work-item">
                <div class="summary">
                    <p></p>
                    <p>{{item.description}}</p>
                    <p></p>
                </div>
                <ul class="highlights">
                    {% for hilight in item.hilights %}
                    <li>
                        <p>{{hilight}}</p>
                    </li>
                    {% endfor %}

                </ul>
            </div>
        </section>
        {% endfor %}
    </section>

    <section class="section">
        <header>
            <h2 class="section-title">{{ __('resume.education') }} <span class="item-count">({{resume.education.length}})</span></h2>
        </header>

        <section id="education">
            {% for item in resume.education %}
            <section class="education-item">
                <header>
                    <div class="header">
                        <div class="course">
                            {{item.course}}
                        </div>
                        <div class="institution">
                            {{item.institution}}
                        </div>
                        <div class="date">
                            {{item.duration}}
                        </div>
                    </div>
                </header>

                <div class="item">
                    <div class="location">
                        <strong class="fa fa-map-marker"></strong> <span>{{item.location}}</span>
                    </div>
                </div>
            </section>
            {% endfor %}

        </section>
    </section>

    <section class="section">
        <header>
            <h2 class="section-title">{{ __('resume.projects') }}</h2>
        </header>
        {% for item in resume.projects %}
        <section id="project">
            <section class="project-item">
                <input id="project-item-{{ loop.index }}" type="checkbox" class="toggle-item" checked="checked">
                <label for="project-item-{{ loop.index }}"></label>

                <header>
                    <div class="header">
                        <div class="title">
                            {{item.title}}
                        </div>
                        <div class="contribution">
                            {{item.contribution}}
                        </div>
                        <div class="date">
                            {{item.duration}}
                        </div>
                    </div>

                </header>

                <div class="item">
                    <div class="summary">
                        <p></p>
                        <p>{{item.description}}</p>
                        <p></p>
                    </div>
                </div>
            </section>
        </section>
        {% endfor %}
    </section>

    <section class="section margin1">
        <header>
            <h2 class="section-title">{{ __('resume.languages') }}</h2>
        </header>
        <section id="languages">
            {% for item in resume.languages %}
            <div class="display">
                <h3 class="language">
                    {{item.name}}
                </h3>
                <div class="item">
                    <div class="level fluency {{item.proficiency}}">
                        <em>{{item.proficiency.toUpperCase()}}</em>
                        <div class="bar"></div>
                    </div>
                </div>
            </div>
            {% endfor %}
        </section>
    </section>

</div>
