; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/0_flac_get_max_frame_size_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/0_flac_get_max_frame_size_3.c"
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
  %count = alloca i32, align 4
  store i32 %blocksize, ptr %blocksize.addr, align 4
  store i32 %ch, ptr %ch.addr, align 4
  store i32 %bps, ptr %bps.addr, align 4
  %0 = load i32, ptr %ch.addr, align 4
  switch i32 %0, label %sw.default [
    i32 2, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i32, ptr %bps.addr, align 4
  %mul = mul nsw i32 2, %1
  %add = add nsw i32 %mul, 1
  %2 = load i32, ptr %blocksize.addr, align 4
  %mul1 = mul nsw i32 %add, %2
  %add2 = add nsw i32 %mul1, 7
  %div = sdiv i32 %add2, 8
  store i32 %div, ptr %count, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %3 = load i32, ptr %ch.addr, align 4
  %4 = load i32, ptr %bps.addr, align 4
  %mul3 = mul nsw i32 %3, %4
  %5 = load i32, ptr %blocksize.addr, align 4
  %mul4 = mul nsw i32 %mul3, %5
  %add5 = add nsw i32 %mul4, 7
  %div6 = sdiv i32 %add5, 8
  store i32 %div6, ptr %count, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  %6 = load i32, ptr %ch.addr, align 4
  %7 = load i32, ptr %bps.addr, align 4
  %add7 = add nsw i32 %7, 14
  %div8 = sdiv i32 %add7, 8
  %mul9 = mul nsw i32 %6, %div8
  %8 = load i32, ptr %count, align 4
  %add10 = add nsw i32 %8, %mul9
  store i32 %add10, ptr %count, align 4
  %9 = load i32, ptr %count, align 4
  %add11 = add nsw i32 %9, 16
  store i32 %add11, ptr %count, align 4
  %10 = load i32, ptr %count, align 4
  %add12 = add nsw i32 %10, 2
  store i32 %add12, ptr %count, align 4
  %11 = load i32, ptr %count, align 4
  ret i32 %11
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
