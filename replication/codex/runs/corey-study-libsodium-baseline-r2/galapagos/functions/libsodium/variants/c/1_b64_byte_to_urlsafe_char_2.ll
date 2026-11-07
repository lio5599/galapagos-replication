; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.c"
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
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  store i32 0, ptr %result, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %arrayidx = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  store i32 %shr, ptr %arrayidx, align 16
  %arrayidx1 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  %1 = load i32, ptr %arrayidx1, align 16
  %not = xor i32 %1, -1
  %2 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %2, 52
  %shr3 = lshr i32 %sub2, 8
  %and = and i32 %not, %shr3
  %arrayidx4 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 1
  store i32 %and, ptr %arrayidx4, align 4
  %3 = load i32, ptr %x.addr, align 4
  %sub5 = sub i32 %3, 52
  %shr6 = lshr i32 %sub5, 8
  %not7 = xor i32 %shr6, -1
  %4 = load i32, ptr %x.addr, align 4
  %sub8 = sub i32 %4, 62
  %shr9 = lshr i32 %sub8, 8
  %and10 = and i32 %not7, %shr9
  %arrayidx11 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 2
  store i32 %and10, ptr %arrayidx11, align 8
  %5 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %5, 62
  %sub12 = sub i32 0, %xor
  %shr13 = lshr i32 %sub12, 8
  %not14 = xor i32 %shr13, -1
  %arrayidx15 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 3
  store i32 %not14, ptr %arrayidx15, align 4
  %6 = load i32, ptr %x.addr, align 4
  %xor16 = xor i32 %6, 63
  %sub17 = sub i32 0, %xor16
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %arrayidx20 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 4
  store i32 %not19, ptr %arrayidx20, align 16
  %7 = load i32, ptr %x.addr, align 4
  %add = add i32 %7, 65
  %arrayidx21 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 0
  store i32 %add, ptr %arrayidx21, align 16
  %8 = load i32, ptr %x.addr, align 4
  %add22 = add i32 %8, 71
  %arrayidx23 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 1
  store i32 %add22, ptr %arrayidx23, align 4
  %9 = load i32, ptr %x.addr, align 4
  %add24 = add i32 %9, -4
  %arrayidx25 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 2
  store i32 %add24, ptr %arrayidx25, align 8
  %arrayidx26 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 3
  store i32 45, ptr %arrayidx26, align 4
  %arrayidx27 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 4
  store i32 95, ptr %arrayidx27, align 16
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %10, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i32, ptr %i, align 4
  %idxprom = zext i32 %11 to i64
  %arrayidx28 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 %idxprom
  %12 = load i32, ptr %arrayidx28, align 4
  %13 = load i32, ptr %i, align 4
  %idxprom29 = zext i32 %13 to i64
  %arrayidx30 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 %idxprom29
  %14 = load i32, ptr %arrayidx30, align 4
  %and31 = and i32 %12, %14
  %15 = load i32, ptr %result, align 4
  %or = or i32 %15, %and31
  store i32 %or, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i32, ptr %i, align 4
  %inc = add i32 %16, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %17 = load i32, ptr %result, align 4
  %and32 = and i32 %17, 255
  ret i32 %and32
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
