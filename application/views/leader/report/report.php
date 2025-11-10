<?php
<div class="container">
    <h4>Production Report</h4>

    <form method="get" action="<?= site_url('leader/report') ?>" class="form-inline mb-3">
        <label class="mr-2">Start</label>
        <input type="date" name="start_date" value="<?= htmlspecialchars($start_date ?? '') ?>" class="form-control mr-2">
        <label class="mr-2">End</label>
        <input type="date" name="end_date" value="<?= htmlspecialchars($end_date ?? '') ?>" class="form-control mr-2">
        <button type="submit" class="btn btn-primary mr-2">Filter</button>
        <a class="btn btn-success" href="<?= site_url('leader/export_report_csv') . '?start_date=' . urlencode($start_date) . '&end_date=' . urlencode($end_date) ?>">Export CSV</a>
    </form>

    <table class="table table-striped">
        <thead><tr><th>Date</th><th>Plan</th><th>Project</th><th>Leader</th><th>Product</th><th>Finished</th><th>Waste</th></tr></thead>
        <tbody>
            <?php if (!empty($report)) : foreach ($report as $r) : ?>
                <tr>
                    <td><?= htmlspecialchars($r->start_date ?? '') ?></td>
                    <td><?= htmlspecialchars($r->plan_name ?? '') ?></td>
                    <td><?= htmlspecialchars($r->project_name ?? '') ?></td>
                    <td><?= htmlspecialchars($r->staff_name ?? '') ?></td>
                    <td><?= htmlspecialchars($r->product_name ?? '') ?></td>
                    <td><?= htmlspecialchars($r->finished ?? '') ?></td>
                    <td><?= htmlspecialchars($r->waste ?? '') ?></td>
                </tr>
            <?php endforeach; else: ?>
                <tr><td colspan="7">No data</td></tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>