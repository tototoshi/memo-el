;;; memo.el

;; Copyright (C) 2014  Toshiyuki Takahashi

;; Author: Toshiyuki Takahashi (@tototoshi)
;; Version: 0.1.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Usage:
;;;
;;; (require 'memo)
;;;
;;; Code:
;;;

(defvar memo-dir "~/.emacs.d/memo")

(defun memo-ensure-dir-exists (file)
  (unless (file-exists-p file)
    (make-directory file t)))

(defun memo (file-type)
  (interactive "sFILE_TYPE: ")
  (let* ((dir (concat (file-name-as-directory memo-dir)
                      (format-time-string "%Y%m%d" (current-time))))
         (file (concat (file-name-as-directory dir)
                       (format-time-string "memo_%Y%m%d%H%M%S" (current-time))
                       "." (if (string= "" file-type) "txt" file-type))))
    (memo-ensure-dir-exists dir)
    (when (one-window-p)
      (split-window))
    (find-file file)))

(provide 'memo)

;;; memo.el ends here
