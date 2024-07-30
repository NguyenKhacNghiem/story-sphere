const log = require('../logs/log');

function uploadImage(req, res) {
    try {
        let fileData = req.file;

        if (!fileData) {
            log.error("Vui lòng chọn file để upload");
            return res.json({code: 1, message: "Vui lòng chọn file để upload"});
        }
        
        log.info("Upload file thành công");
        res.json({ code: 0, message: "Upload file thành công", url: fileData.path });
    } catch(err) {
        log.error(err.message);
        res.json({ code: 1, message: "Upload file thất bại" });
    }
}

module.exports = {
    uploadImage
};