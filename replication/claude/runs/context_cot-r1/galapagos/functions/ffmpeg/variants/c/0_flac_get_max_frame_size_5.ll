; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/0_flac_get_max_frame_size_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/0_flac_get_max_frame_size_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @flac_get_max_frame_size(i32 noundef 0, i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @flac_get_max_frame_size(i32 noundef %blocksize, i32 noundef %ch, i32 noundef %bps) #0 {
entry:
  %blocksize.addr = alloca i32, align 4
  %ch.addr = alloca i32, align 4
  %bps.addr = alloca i32, align 4
  %b = alloca i64, align 8
  %n = alloca i64, align 8
  %bs = alloca i64, align 8
  %bits = alloca i64, align 8
  %count = alloca i64, align 8
  store i32 %blocksize, ptr %blocksize.addr, align 4
  store i32 %ch, ptr %ch.addr, align 4
  store i32 %bps, ptr %bps.addr, align 4
  %0 = load i32, ptr %bps.addr, align 4
  %conv = sext i32 %0 to i64
  store i64 %conv, ptr %b, align 8
  %1 = load i32, ptr %ch.addr, align 4
  %conv1 = sext i32 %1 to i64
  store i64 %conv1, ptr %n, align 8
  %2 = load i32, ptr %blocksize.addr, align 4
  %conv2 = sext i32 %2 to i64
  store i64 %conv2, ptr %bs, align 8
  %3 = load i32, ptr %ch.addr, align 4
  %cmp = icmp eq i32 %3, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i64, ptr %b, align 8
  %mul = mul nsw i64 2, %4
  %add = add nsw i64 %mul, 1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %5 = load i64, ptr %n, align 8
  %6 = load i64, ptr %b, align 8
  %mul4 = mul nsw i64 %5, %6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %add, %cond.true ], [ %mul4, %cond.false ]
  store i64 %cond, ptr %bits, align 8
  %7 = load i64, ptr %n, align 8
  %8 = load i64, ptr %b, align 8
  %add5 = add nsw i64 7, %8
  %add6 = add nsw i64 %add5, 7
  %div = sdiv i64 %add6, 8
  %mul7 = mul nsw i64 %7, %div
  %add8 = add nsw i64 16, %mul7
  %9 = load i64, ptr %bits, align 8
  %10 = load i64, ptr %bs, align 8
  %mul9 = mul nsw i64 %9, %10
  %add10 = add nsw i64 %mul9, 7
  %div11 = sdiv i64 %add10, 8
  %add12 = add nsw i64 %add8, %div11
  %add13 = add nsw i64 %add12, 2
  store i64 %add13, ptr %count, align 8
  %11 = load i64, ptr %count, align 8
  %conv14 = trunc i64 %11 to i32
  ret i32 %conv14
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
