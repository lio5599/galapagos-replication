; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %masks = alloca [5 x i32], align 16
  %values = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %not, 255
  store i32 %and, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %shr5 = lshr i32 %or4, 8
  %not6 = xor i32 %shr5, -1
  %and7 = and i32 %not6, 255
  store i32 %and7, ptr %arrayinit.element, align 4
  %arrayinit.element8 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %5 = load i32, ptr %u, align 4
  %sub9 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 57, %6
  %or11 = or i32 %sub9, %sub10
  %shr12 = lshr i32 %or11, 8
  %not13 = xor i32 %shr12, -1
  %and14 = and i32 %not13, 255
  store i32 %and14, ptr %arrayinit.element8, align 4
  %arrayinit.element15 = getelementptr inbounds i32, ptr %arrayinit.element8, i64 1
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub16 = sub i32 0, %xor
  %shr17 = lshr i32 %sub16, 8
  %not18 = xor i32 %shr17, -1
  %and19 = and i32 %not18, 255
  store i32 %and19, ptr %arrayinit.element15, align 4
  %arrayinit.element20 = getelementptr inbounds i32, ptr %arrayinit.element15, i64 1
  %8 = load i32, ptr %u, align 4
  %xor21 = xor i32 %8, 47
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %not24 = xor i32 %shr23, -1
  %and25 = and i32 %not24, 255
  store i32 %and25, ptr %arrayinit.element20, align 4
  %arrayinit.begin26 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 0
  %9 = load i32, ptr %u, align 4
  %sub27 = sub i32 %9, 65
  store i32 %sub27, ptr %arrayinit.begin26, align 4
  %arrayinit.element28 = getelementptr inbounds i32, ptr %arrayinit.begin26, i64 1
  %10 = load i32, ptr %u, align 4
  %sub29 = sub i32 %10, 71
  store i32 %sub29, ptr %arrayinit.element28, align 4
  %arrayinit.element30 = getelementptr inbounds i32, ptr %arrayinit.element28, i64 1
  %11 = load i32, ptr %u, align 4
  %sub31 = sub i32 %11, -4
  store i32 %sub31, ptr %arrayinit.element30, align 4
  %arrayinit.element32 = getelementptr inbounds i32, ptr %arrayinit.element30, i64 1
  store i32 62, ptr %arrayinit.element32, align 4
  %arrayinit.element33 = getelementptr inbounds i32, ptr %arrayinit.element32, i64 1
  store i32 63, ptr %arrayinit.element33, align 4
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %12, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %i, align 4
  %idxprom = zext i32 %13 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 %idxprom
  %14 = load i32, ptr %arrayidx, align 4
  %15 = load i32, ptr %i, align 4
  %idxprom34 = zext i32 %15 to i64
  %arrayidx35 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 %idxprom34
  %16 = load i32, ptr %arrayidx35, align 4
  %and36 = and i32 %14, %16
  %17 = load i32, ptr %x, align 4
  %or37 = or i32 %17, %and36
  store i32 %or37, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %inc = add i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %sub38 = sub i32 0, %20
  %shr39 = lshr i32 %sub38, 8
  %not40 = xor i32 %shr39, -1
  %21 = load i32, ptr %u, align 4
  %xor41 = xor i32 %21, 65
  %sub42 = sub i32 0, %xor41
  %shr43 = lshr i32 %sub42, 8
  %and44 = and i32 %not40, %shr43
  %and45 = and i32 %and44, 255
  %or46 = or i32 %19, %and45
  ret i32 %or46
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
