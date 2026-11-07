; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %masks = alloca [5 x i32], align 16
  %values = alloca [5 x i32], align 16
  %r = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  store i32 0, ptr %r, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %arrayidx = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  store i32 %and, ptr %arrayidx, align 16
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  %arrayidx4 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 1
  store i32 %and3, ptr %arrayidx4, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub5 = sub i32 %2, 62
  %shr6 = lshr i32 %sub5, 8
  %and7 = and i32 %shr6, 255
  %arrayidx8 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 2
  store i32 %and7, ptr %arrayidx8, align 8
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub9 = sub i32 0, %xor
  %shr10 = lshr i32 %sub9, 8
  %and11 = and i32 %shr10, 255
  %xor12 = xor i32 %and11, 255
  %arrayidx13 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 3
  store i32 %xor12, ptr %arrayidx13, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor14 = xor i32 %4, 63
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  %xor18 = xor i32 %and17, 255
  %arrayidx19 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 4
  store i32 %xor18, ptr %arrayidx19, align 16
  %arrayidx20 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 1
  %5 = load i32, ptr %arrayidx20, align 4
  %xor21 = xor i32 %5, 255
  %arrayidx22 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 2
  %6 = load i32, ptr %arrayidx22, align 8
  %and23 = and i32 %6, %xor21
  store i32 %and23, ptr %arrayidx22, align 8
  %arrayidx24 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  %7 = load i32, ptr %arrayidx24, align 16
  %xor25 = xor i32 %7, 255
  %arrayidx26 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 1
  %8 = load i32, ptr %arrayidx26, align 4
  %and27 = and i32 %8, %xor25
  store i32 %and27, ptr %arrayidx26, align 4
  %9 = load i32, ptr %x.addr, align 4
  %add = add i32 %9, 65
  %arrayidx28 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 0
  store i32 %add, ptr %arrayidx28, align 16
  %10 = load i32, ptr %x.addr, align 4
  %add29 = add i32 %10, 71
  %arrayidx30 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 1
  store i32 %add29, ptr %arrayidx30, align 4
  %11 = load i32, ptr %x.addr, align 4
  %add31 = add i32 %11, -4
  %arrayidx32 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 2
  store i32 %add31, ptr %arrayidx32, align 8
  %arrayidx33 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 3
  store i32 45, ptr %arrayidx33, align 4
  %arrayidx34 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 4
  store i32 95, ptr %arrayidx34, align 16
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %12, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %i, align 4
  %idxprom = zext i32 %13 to i64
  %arrayidx35 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 %idxprom
  %14 = load i32, ptr %arrayidx35, align 4
  %15 = load i32, ptr %i, align 4
  %idxprom36 = zext i32 %15 to i64
  %arrayidx37 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 %idxprom36
  %16 = load i32, ptr %arrayidx37, align 4
  %and38 = and i32 %14, %16
  %17 = load i32, ptr %r, align 4
  %or = or i32 %17, %and38
  store i32 %or, ptr %r, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %inc = add i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %19 = load i32, ptr %r, align 4
  ret i32 %19
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
