module.exports = {
    content: [
        "./lib/**/*.dart",
        "./web/**/*.html",
        "./web/**/*.js",
    ],
    theme: {
        extend: {
            colors: {
                // You can add custom colors here
            },
            fontFamily: {
                // You can add custom fonts here
            },
        },
    },
    plugins: [
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
    ],
}
