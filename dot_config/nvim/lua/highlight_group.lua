local function show_highlight_groups()
    local highlights = {}

    -- 모든 하이라이트 그룹 가져오기 (최신 API 사용)
    local all_highlights = vim.api.nvim_get_hl(0, {})
    for name, _ in pairs(all_highlights) do
        table.insert(highlights, name)
    end

    -- 추가로 내장 하이라이트 그룹들도 포함
    local builtin_groups = {
        'Normal', 'Comment', 'Constant', 'String', 'Character', 'Number', 'Boolean', 'Float',
        'Identifier', 'Function', 'Statement', 'Conditional', 'Repeat', 'Label', 'Operator',
        'Keyword', 'Exception', 'PreProc', 'Include', 'Define', 'Macro', 'PreCondit',
        'Type', 'StorageClass', 'Structure', 'Typedef', 'Special', 'SpecialChar', 'Tag',
        'Delimiter', 'SpecialComment', 'Debug', 'Underlined', 'Ignore', 'Error', 'Todo',
        'LineNr', 'CursorLine', 'CursorColumn', 'Visual', 'Search', 'IncSearch',
        'StatusLine', 'StatusLineNC', 'VertSplit', 'Folded', 'FoldColumn', 'SignColumn',
        'Pmenu', 'PmenuSel', 'PmenuSbar', 'PmenuThumb', 'TabLine', 'TabLineFill', 'TabLineSel'
    }

    for _, group in ipairs(builtin_groups) do
        if not vim.tbl_contains(highlights, group) then
            table.insert(highlights, group)
        end
    end

    -- 정렬
    table.sort(highlights)

    -- Telescope로 선택
    require('telescope.pickers').new({}, {
        prompt_title = 'Highlight Groups (' .. #highlights .. ' total)',
        finder = require('telescope.finders').new_table({
            results = highlights,
            entry_maker = function(entry)
                -- 하이라이트 그룹 정보 가져오기
                local hl_info = vim.api.nvim_get_hl(0, { name = entry })
                local display_text = entry

                -- 색상 정보가 있으면 추가
                if next(hl_info) ~= nil then
                    local color_info = {}
                    if hl_info.fg then
                        table.insert(color_info, string.format('fg:#%06x', hl_info.fg))
                    end
                    if hl_info.bg then
                        table.insert(color_info, string.format('bg:#%06x', hl_info.bg))
                    end
                    if hl_info.bold then
                        table.insert(color_info, 'bold')
                    end
                    if hl_info.italic then
                        table.insert(color_info, 'italic')
                    end
                    if hl_info.underline then
                        table.insert(color_info, 'underline')
                    end

                    if #color_info > 0 then
                        display_text = entry .. '  (' .. table.concat(color_info, ', ') .. ')'
                    end
                end

                return {
                    value = entry,
                    display = display_text,
                    ordinal = entry,
                }
            end
        }),
        sorter = require('telescope.config').values.generic_sorter({}),
        previewer = require('telescope.previewers').new_buffer_previewer({
            title = 'Highlight Preview',
            define_preview = function(self, entry, status)
                local hl_name = entry.value
                local hl_info = vim.api.nvim_get_hl(0, { name = hl_name })

                local lines = {
                    'Highlight Group: ' .. hl_name,
                    '',
                    'Sample Text with this highlight',
                    '',
                    'Properties:'
                }

                if next(hl_info) ~= nil then
                    if hl_info.fg then
                        table.insert(lines, '  Foreground: #' .. string.format('%06x', hl_info.fg))
                    end
                    if hl_info.bg then
                        table.insert(lines, '  Background: #' .. string.format('%06x', hl_info.bg))
                    end
                    if hl_info.bold then
                        table.insert(lines, '  Bold: true')
                    end
                    if hl_info.italic then
                        table.insert(lines, '  Italic: true')
                    end
                    if hl_info.underline then
                        table.insert(lines, '  Underline: true')
                    end
                    if hl_info.strikethrough then
                        table.insert(lines, '  Strikethrough: true')
                    end
                else
                    table.insert(lines, '  No properties defined')
                end

                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)

                -- 샘플 텍스트에 실제 하이라이트 적용
                vim.api.nvim_buf_add_highlight(self.state.bufnr, -1, hl_name, 2, 0, -1)
            end,
        }),
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<CR>', function()
                local selection = require('telescope.actions.state').get_selected_entry()
                require('telescope.actions').close(prompt_bufnr)

                -- 선택된 하이라이트 그룹 정보 출력
                local hl_info = vim.api.nvim_get_hl(0, { name = selection.value })
                if next(hl_info) == nil then
                    print('Highlight group "' .. selection.value .. '" is not defined or empty')
                else
                    print('Highlight group: ' .. selection.value)
                    print(vim.inspect(hl_info))
                end
            end)
            return true
        end,
    }):find()
end

vim.keymap.set('n', '<leader>hi', show_highlight_groups)
