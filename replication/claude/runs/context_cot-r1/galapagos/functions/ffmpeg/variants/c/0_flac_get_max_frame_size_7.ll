; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/0_flac_get_max_frame_size_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/0_flac_get_max_frame_size_7.c"
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
  %acc = alloca i32, align 4
  store i32 %blocksize, ptr %blocksize.addr, align 4
  store i32 %ch, ptr %ch.addr, align 4
  store i32 %bps, ptr %bps.addr, align 4
  store i32 2, ptr %acc, align 4
  %0 = load i32, ptr %ch.addr, align 4
  %cmp = icmp eq i32 %0, 2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %bps.addr, align 4
  %mul = mul nsw i32 2, %1
  %add = add nsw i32 %mul, 1
  %2 = load i32, ptr %blocksize.addr, align 4
  %mul1 = mul nsw i32 %add, %2
  %add2 = add nsw i32 %mul1, 7
  %div = sdiv i32 %add2, 8
  %3 = load i32, ptr %acc, align 4
  %add3 = add i32 %3, %div
  store i32 %add3, ptr %acc, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %4 = load i32, ptr %ch.addr, align 4
  %5 = load i32, ptr %bps.addr, align 4
  %mul4 = mul nsw i32 %4, %5
  %6 = load i32, ptr %blocksize.addr, align 4
  %mul5 = mul nsw i32 %mul4, %6
  %add6 = add nsw i32 %mul5, 7
  %div7 = sdiv i32 %add6, 8
  %7 = load i32, ptr %acc, align 4
  %add8 = add i32 %7, %div7
  store i32 %add8, ptr %acc, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i32, ptr %acc, align 4
  %add9 = add i32 %8, 16
  store i32 %add9, ptr %acc, align 4
  %9 = load i32, ptr %ch.addr, align 4
  %10 = load i32, ptr %bps.addr, align 4
  %add10 = add nsw i32 7, %10
  %add11 = add nsw i32 %add10, 7
  %div12 = sdiv i32 %add11, 8
  %mul13 = mul nsw i32 %9, %div12
  %11 = load i32, ptr %acc, align 4
  %add14 = add i32 %11, %mul13
  store i32 %add14, ptr %acc, align 4
  %12 = load i32, ptr %acc, align 4
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
