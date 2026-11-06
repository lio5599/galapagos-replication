; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/0_flac_get_max_frame_size_0.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/0_flac_get_max_frame_size_0.c"
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
  %hdr = alloca i32, align 4
  %bits = alloca i32, align 4
  %count = alloca i32, align 4
  store i32 %blocksize, ptr %blocksize.addr, align 4
  store i32 %ch, ptr %ch.addr, align 4
  store i32 %bps, ptr %bps.addr, align 4
  %0 = load i32, ptr %bps.addr, align 4
  %add = add nsw i32 7, %0
  %add1 = add nsw i32 %add, 7
  %div = sdiv i32 %add1, 8
  store i32 %div, ptr %hdr, align 4
  store i32 16, ptr %count, align 4
  %1 = load i32, ptr %ch.addr, align 4
  %2 = load i32, ptr %hdr, align 4
  %mul = mul nsw i32 %1, %2
  %3 = load i32, ptr %count, align 4
  %add2 = add nsw i32 %3, %mul
  store i32 %add2, ptr %count, align 4
  %4 = load i32, ptr %ch.addr, align 4
  %cmp = icmp eq i32 %4, 2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %5 = load i32, ptr %bps.addr, align 4
  %mul3 = mul nsw i32 2, %5
  %add4 = add nsw i32 %mul3, 1
  store i32 %add4, ptr %bits, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %6 = load i32, ptr %ch.addr, align 4
  %7 = load i32, ptr %bps.addr, align 4
  %mul5 = mul nsw i32 %6, %7
  store i32 %mul5, ptr %bits, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i32, ptr %bits, align 4
  %9 = load i32, ptr %blocksize.addr, align 4
  %mul6 = mul nsw i32 %8, %9
  %add7 = add nsw i32 %mul6, 7
  %div8 = sdiv i32 %add7, 8
  %10 = load i32, ptr %count, align 4
  %add9 = add nsw i32 %10, %div8
  store i32 %add9, ptr %count, align 4
  %11 = load i32, ptr %count, align 4
  %add10 = add nsw i32 %11, 2
  store i32 %add10, ptr %count, align 4
  %12 = load i32, ptr %count, align 4
  ret i32 %12
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
