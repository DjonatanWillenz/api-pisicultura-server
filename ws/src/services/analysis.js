const { Analysis: AnalysisModel } = require("../models/analysis");

const installationService = require("../services/installation");

module.exports = {
    async create(data) {
        const installation = installationService.findByKey(data.key);
        if (installation) {
            const analysis = AnalysisModel({
                ph: data.ph,
                temperature: data.temperature,
                installation: installation
            });
            analysis.save();
        }
    },
}