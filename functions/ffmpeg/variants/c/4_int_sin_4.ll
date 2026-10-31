; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/4_int_sin_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/4_int_sin_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @int_sin(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @int_sin(i64 noundef %a) #0 {
entry:
  %a.addr = alloca i64, align 8
  %a2 = alloca i64, align 8
  %res = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %a, ptr %a.addr, align 8
  store i64 0, ptr %res, align 8
  %0 = load i64, ptr %a.addr, align 8
  %cmp = icmp slt i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i64, ptr %a.addr, align 8
  %sub = sub nsw i64 3294199, %1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i64, ptr %a.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ %2, %cond.false ]
  %rem = srem i64 %cond, 6588398
  store i64 %rem, ptr %a.addr, align 8
  %3 = load i64, ptr %a.addr, align 8
  %cmp1 = icmp sge i64 %3, 4941298
  br i1 %cmp1, label %cond.true2, label %cond.false4

cond.true2:                                       ; preds = %cond.end
  %4 = load i64, ptr %a.addr, align 8
  %sub3 = sub nsw i64 %4, 6588398
  br label %cond.end5

cond.false4:                                      ; preds = %cond.end
  %5 = load i64, ptr %a.addr, align 8
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false4, %cond.true2
  %cond6 = phi i64 [ %sub3, %cond.true2 ], [ %5, %cond.false4 ]
  store i64 %cond6, ptr %a.addr, align 8
  %6 = load i64, ptr %a.addr, align 8
  %cmp7 = icmp sge i64 %6, 1647099
  br i1 %cmp7, label %cond.true8, label %cond.false10

cond.true8:                                       ; preds = %cond.end5
  %7 = load i64, ptr %a.addr, align 8
  %sub9 = sub nsw i64 3294199, %7
  br label %cond.end11

cond.false10:                                     ; preds = %cond.end5
  %8 = load i64, ptr %a.addr, align 8
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true8
  %cond12 = phi i64 [ %sub9, %cond.true8 ], [ %8, %cond.false10 ]
  store i64 %cond12, ptr %a.addr, align 8
  %9 = load i64, ptr %a.addr, align 8
  %10 = load i64, ptr %a.addr, align 8
  %mul = mul nsw i64 %9, %10
  %div = sdiv i64 %mul, 1048576
  store i64 %div, ptr %a2, align 8
  store i32 2, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end11
  %11 = load i32, ptr %i, align 4
  %cmp13 = icmp sle i32 %11, 10
  br i1 %cmp13, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i64, ptr %a.addr, align 8
  %13 = load i64, ptr %res, align 8
  %add = add nsw i64 %13, %12
  store i64 %add, ptr %res, align 8
  %14 = load i64, ptr %a.addr, align 8
  %15 = load i64, ptr %a2, align 8
  %mul14 = mul nsw i64 %14, %15
  %16 = load i32, ptr %i, align 4
  %conv = sext i32 %16 to i64
  %mul15 = mul nsw i64 1048576, %conv
  %17 = load i32, ptr %i, align 4
  %add16 = add nsw i32 %17, 1
  %conv17 = sext i32 %add16 to i64
  %mul18 = mul nsw i64 %mul15, %conv17
  %div19 = sdiv i64 %mul14, %mul18
  %sub20 = sub nsw i64 0, %div19
  store i64 %sub20, ptr %a.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %add21 = add nsw i32 %18, 2
  store i32 %add21, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %19 = load i64, ptr %res, align 8
  %add22 = add nsw i64 %19, 8
  %shr = ashr i64 %add22, 4
  ret i64 %shr
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
